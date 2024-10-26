import Controller from "../controller.js";
import PostModel from "./model.js";
import Where from "../sql/where.js";
import { body } from "express-validator";
import PostFavoritesModel from "./favorite/model.js";

class PostController extends Controller {
    constructor() {
        super(new PostModel(), [
            body('title')
                .notEmpty().withMessage('Title cannot be empty'),

            body('content')
                .notEmpty().withMessage('Content cannot be empty')
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
        let sortBy = 'id';
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
        const allowedFilter = ['id', 'status', 'showOnHomepage', 'categories', 'creationAtStart', 'creationAtEnd'];
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
            if (!req?.user) {
                return this._returnAccessDenied(res);
            }

            const model = new PostFavoritesModel();
            const postIds = await model.getPostIdsByUserId(req.user.id);

            req.query.id = postIds.join(',');

            return this.getAll(req, res, next);
        } catch (error) {
            next(error);
        }
    }
}

export default new PostController();