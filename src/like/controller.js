const e = require("express");
const Controller = require('./../controller');
const LikeModel = require('./model');
const PostModel = require('./../post/model');
const Where = require('./../sql/where');

class CategoryController extends Controller {
    /**
     * @type {LikeModel}
     */
    _model;

    constructor() {
        super(new LikeModel());

        this._accessPolicies.user
            .setRead();
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

            let entityName = undefined;
            let entityId = undefined;
            if (fields.commentId) {
                entityName = 'commentId';
                entityId = fields.commentId;
            } else if (fields.postId) {
                entityName = 'postId';
                entityId = fields.postId;
            }

            let like = await this._model.getLikeByCreationByIdAndPostOrCommentId(fields.createdByUserId, entityName, entityId);
            if (!like) {
                like = this._model.createEntity(fields);
            } else {
                like.type = fields.type;
            }

            await like.save();

            if (entityName === 'postId') {
                const postModel = new PostModel();
                await postModel.recalculateLikesByPostId(entityId);
            }

            return res.status(201).json({
                data: like.toJSON(),
            });
        } catch (e) {
            next(e);
        }
    }
}

module.exports = new CategoryController();