import Controller from './../controller.js';
import CommentModel from "./model.js";
import PostModel from "../post/model.js";
import Where from './../sql/where.js';
import { body } from "express-validator";

class CommentController extends Controller {
    constructor() {
        super(new CommentModel(), [
            body('content')
                .notEmpty().withMessage('Content cannot be empty'),

            body('status')
                .optional()
                .isIn(['active', 'inactive']).withMessage('Comment status should be active or inactive')
        ]);

        this._accessPolicies.user
            .setRead()
            .setUpdate(['content', 'status', 'isHelpful'], [ { field: this._model._creationByRelationFieldName, operator: '=', value: '' } ]);

        this._accessPolicies.guest
            .setRead();
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async createCommentByPostId(req, res, next) {
        req.body.postId = req.params.postId;
        return this.create(req, res, next);
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async createCommentByCommentId(req, res, next) {
        req.body.commentId = req.params.commentId;
        return this.create(req, res, next);
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async getCommentsByPostId(req, res, next) {
        req.query.postId = req.params.postId;
        return this.getAll(req, res, next);
    }

    /**
     * @inheritDoc
     */
    _prepareFilters(req) {
        const filter = [];
        const allowedFilter = ['postId', 'creationById'];
        Object.keys(req.query).forEach(fieldName => {
            if (allowedFilter.includes(fieldName) && !filter.hasOwnProperty(fieldName)) {
                if (fieldName === 'postId') {
                    filter.push(new Where(fieldName, '=', req.query[fieldName]));
                    filter.push(new Where('commentId', 'IS', null));
                } else {
                    filter.push(new Where(fieldName, '=', req.query[fieldName]));
                }
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
    async setHelpful(req, res, next) {
        try {
            const comment = await this._model.getEntityById(req.params.id);
            if (!comment) {
                return this._returnNotFound(res);
            }

            const postModel = new PostModel();
            const post = await postModel.getEntityById(comment.postId);
            if (!post) {
                return this._returnNotFound(res);
            }

            if (post[postModel._creationByRelationFieldName] !== req.user.id) {
                return this._returnResponse(
                    res,
                    403,
                    {},
                    "Only the creator of the post can choose the most helpful comment."
                );
            }

            comment.isHelpful = !comment.isHelpful;
            await comment.save();

            return this._returnResponse(res, 200, {
                data: comment.toJSON()
            });
        } catch (e) {
            next(e);
        }
    }

    _prepareSort(req) {
        return 'isHelpful DESC, id DESC';
    }
}

export default new CommentController();