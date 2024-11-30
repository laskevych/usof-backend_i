import Controller from "../controller.js";
import PostModel from "./model.js";
import Where from "../sql/where.js";
import { body } from "express-validator";
import PostFavoritesModel from "./favorite/model.js";
import PostCategoryModel from "./category/model.js";

class PostController extends Controller {
    constructor() {
        super(new PostModel(), [
            body('title')
                .notEmpty().withMessage('Title cannot be empty'),

            body('content')
                .notEmpty().withMessage('Content cannot be empty'),

            body('status')
                .optional()
                .isIn(['active', 'inactive']).withMessage('Post status should be active or inactive')
        ]);

        this._totalEntitiesPerPage = 10;

        const allowedFieldsForUser = this._model._fields.filter(field => !['likes', 'showOnHomepage'].includes(field));
        this._accessPolicies.user
            .setCreate(allowedFieldsForUser)
            .setRead([], [
                [
                    { field: 'status', operator: '=', value: 'active' },
                    { field: this._model._creationByRelationFieldName, operator: '=', value: ''}
                ]
            ])
            .setUpdate(allowedFieldsForUser, [ { field: this._model._creationByRelationFieldName, operator: '=', value: ''} ])
            .setDelete(allowedFieldsForUser, [ { field: this._model._creationByRelationFieldName, operator: '=', value: ''} ]);

        this._accessPolicies.guest
            .setRead([], [{ field: 'status', operator: '=', value: 'active' }]);
    }

    /**
     * @inheritDoc
     */
    _prepareSort(req) {
        const allowedSort = ['likes', 'creationAt'];
        let sortBy = 'creationAt DESC';
        if (req.query && req.query.hasOwnProperty('sortBy')) {
            const sortParts = req.query.sortBy.split('-');
            if (!allowedSort.includes(sortParts[0])) {
                return sortBy;
            }

            if (sortParts.length === 1) {
                sortBy = `${sortParts[0].trim()} ASC`
            } else if (
                sortParts.length === 2
                && ['ASC', 'DESC'].includes(sortParts[1].trim().toUpperCase())
            ) {
                sortBy = `${sortParts[0].trim()} ${sortParts[1].trim().toUpperCase()}`
            }
        }

        return sortBy;
    }

    /**
     * @inheritDoc
     */
    _prepareFilters(req) {
        const filter = [];
        const allowedFilter = ['id', 'status', 'showOnHomepage', 'categories', 'creationAtStart', 'creationAtEnd', 'creationById', 'title'];
        Object.keys(req.query).forEach(fieldName => {
            if (allowedFilter.includes(fieldName) && !filter.hasOwnProperty(fieldName)) {
                let field, operator;
                field = fieldName;
                let value = req.query[fieldName];
                switch (fieldName) {
                    case 'id':
                        operator = 'IN';
                        value = value.trim().split(',');
                        break;
                    case 'categories':
                        operator = 'IN';
                        value = value.trim().split(',');
                        break;
                    case 'creationAtStart':
                        operator = '>=';
                        field = 'creationAt';
                        break;
                    case 'creationAtEnd':
                        operator = '<=';
                        field = 'creationAt';
                        break;
                    case 'title':
                        operator = 'LIKE';
                        value = `%${value.trim()}%`;
                        break;
                    default:
                        operator = '=';
                        break;
                }

                filter.push(new Where(field, operator, value));
            }
        });

        return filter;
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async getPostsByCategoryId(req, res, next) {
        req.query.categories = req.params.categoryId;

        return this.getAll(req, res, next);
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async getFavoritePosts(req, res, next) {
        try {
            const model = new PostFavoritesModel();
            const postIds = await model.getPostIdsByUserId(req?.params?.userId);

            req.query.id = postIds.join(',');

            return this.getAll(req, res, next);
        } catch (error) {
            next(error);
        }
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async getUserPosts(req, res, next) {
        try {
            req.query.creationById = req.params.userId;
            return this.getAll(req, res, next);
        } catch (error) {
            next(error);
        }
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async create(req, res, next) {
        try {
            const fields = this._prepareFields(req);
            if (this._model._fields.includes(this._model._creationByRelationFieldName)) {
                fields[this._model._creationByRelationFieldName] = req.user.id;
            }

            const newEntity = this._model.createEntity(fields);
            await newEntity.save();


            const categoryIds = new Set();
            if (req?.body?.categories && req?.body?.categories.length > 0) {
                req.body.categories.split(',').forEach(categoryId => {
                    if (Number.isInteger(Number(categoryId))) {
                        categoryIds.add(Number(categoryId));
                    }
                });
            }

            if (categoryIds.size > 0 && newEntity.id) {
                const postCategoryModel = new PostCategoryModel();
                await postCategoryModel.syncCategories(newEntity.id, categoryIds);
            }

            const post = await this._model.getEntityById(newEntity.id);

            return res.status(201).json({
                data: post.toJSON(),
            });
        } catch (e) {
            next(e);
        }
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<express.Response>}
     */
    async update(req, res, next) {
        try {
            const entity = await this._getEntityByIdAndAccessFilter(req);
            if (!entity) {
                return this._returnNotFound(res);
            }

            Object.assign(entity, this._prepareFields(req));
            await entity.save();


            if (req?.body?.categories !== undefined) {
                const categoryIds = new Set();
                if (req.body.categories.length > 0) {
                    req.body.categories.split(',').forEach(categoryId => {
                        if (Number.isInteger(Number(categoryId))) {
                            categoryIds.add(Number(categoryId));
                        }
                    });
                }

                if (entity.id) {
                    const postCategoryModel = new PostCategoryModel();
                    await postCategoryModel.syncCategories(entity.id, categoryIds);
                }
            }

            const post = await this._model.getEntityById(entity.id);

            return this._returnResponse(res, 200, {
                data: post.toJSON()
            });
        } catch (e) {
            next(e);
        }
    }
}

export default new PostController();