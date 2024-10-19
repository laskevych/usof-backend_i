const e = require("express");
const Controller = require('./../controller');
const CommentModel = require('./model');
const PostModel = require('./../post/model');
const Where = require('./../sql/where');
const { body } = require("express-validator");

class CommentController extends Controller {
    constructor() {
        super(new CommentModel(), [
            body('content')
                .notEmpty().withMessage('Content cannot be empty')
        ]);

        this._accessPolicies.user
            .setRead();

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
    async getCommentsByPostId(req, res, next) {
        req.query.postId = req.params.postId;
        return this.getAll(req, res, next);
    }

    /**
     * @inheritDoc
     */
    _prepareFilters(req) {
        const filter = [];
        const allowedFilter = ['postId', 'createdByUserId'];
        Object.keys(req.query).forEach(fieldName => {
            if (allowedFilter.includes(fieldName) && !filter.hasOwnProperty(fieldName)) {
                filter.push(new Where(fieldName, '=', req.query[fieldName]));
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
                    "Only the creator of the post can choose the most useful comment."
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
}

module.exports = new CommentController();