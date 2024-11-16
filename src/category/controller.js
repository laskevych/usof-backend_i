import Controller from './../controller.js';
import CategoryModel from './model.js';
import Where from './../sql/where.js';
import { body } from "express-validator";

class CategoryController extends Controller {
    constructor() {
        super(new CategoryModel(), [
            body('title')
                .notEmpty().withMessage('Title cannot be empty'),

            body('description')
                .optional()
        ]);

        this._accessPolicies.user
            .removeCreate()
            .setRead()
            .removeUpdate()
            .removeDelete();

        this._accessPolicies.guest
            .setRead();
    }

    /**
     * @inheritDoc
     */
    _prepareFilters(req) {
        const filter = [];
        const allowedFilter = ['postId'];
        Object.keys(req.query).forEach(fieldName => {
            if (allowedFilter.includes(fieldName) && !filter.hasOwnProperty(fieldName)) {
                filter.push(new Where(fieldName, '=', req.query[fieldName]));
            }
        });

        return filter;
    }

    /**
     * @param {Request} req
     * @param {Response} res
     * @param {NextFunction} next
     * @return {Promise<e.Response>}
     */
    async getCategoriesByPostId(req, res, next) {
        try {
            const categories = await this._model.getCategoriesByPostId(req.params.postId)

            return this._returnResponse(res, 200, {
                data: categories.map(entity => entity.toJSON())
            });
        } catch (e) {
            next(e);
        }
    }
}

export default new CategoryController();