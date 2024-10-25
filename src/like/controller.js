const e = require("express");
const Controller = require('./../controller');
const LikeModel = require('./model');
const PostModel = require('./../post/model');
const CommentModel = require('./../comment/model');
const Where = require('./../sql/where');
const { body } = require("express-validator");

class LikeController extends Controller {
    constructor() {
        super(
            new LikeModel(), [
                body('type')
                    .notEmpty().withMessage('Please provide a like type.')
                    .isIn(['like', 'dislike']).withMessage('Like type should be like or dislike')
            ]
        );

        this._accessPolicies.user
            .setRead();
    }

    /**
     * @param {LikeEntity} like
     * @param {string} entityName
     * @param {number} entityId
     * @param {boolean} isDeleted
     * @return {Promise<void>}
     * @private
     */
    async _changeUserRating(like, entityName, entityId, isDeleted = false) {
        let entityAuthor;
        if (entityName === 'postId') {
            const postModel = new PostModel();
            await postModel.recalculateLikesByPostId(entityId);
            const post = await postModel.getEntityById(entityId);
            entityAuthor = post.author;
        } else if (entityName === 'commentId') {
            const commentModel = new CommentModel();
            const comment = await commentModel.getEntityById(entityId);
            entityAuthor = comment.author;
        }

        if (entityAuthor) {
            if (like.isLike()) {
                if (isDeleted) {
                    await entityAuthor.decreaseRating();
                } else {
                    await entityAuthor.increaseRating();
                }
            } else {
                if (isDeleted) {
                    await entityAuthor.increaseRating();

                } else {
                    await entityAuthor.decreaseRating();
                }
            }
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

            let entityName = undefined;
            let entityId = undefined;
            if (fields.commentId) {
                entityName = 'commentId';
                entityId = fields.commentId;
            } else if (fields.postId) {
                entityName = 'postId';
                entityId = fields.postId;
            }

            let likeStatus;
            let like = await this._model.getLikeByCreationByIdAndPostOrCommentId(req.user.id, entityName, entityId);
            if (!like) {
                like = this._model.createEntity(fields);
                await like.save();
                likeStatus = 'created';
            } else {
                if (like.type !== fields.type) {
                    like.type = fields.type;
                    await like.save();
                    likeStatus = 'changed';
                }
            }

            if (likeStatus) {
                await this._changeUserRating(like, entityName, entityId);
            }

            return res.status(201).json({
                data: like.toJSON(),
            });
        } catch (e) {
            next(e);
        }
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async delete(req, res, next) {
        try {
            /**
             * @type {LikeEntity}
             */
            const like = await this._getEntityByIdAndAccessFilter(req);
            if (!like) {
                return this._returnNotFound(res);
            }

            await like.delete();

            await this._changeUserRating(
                like,
                like.postId ? 'postId' : 'commentId',
                like.postId ?? like.commentId,
                true
            );

            return this._returnResponse(res, 200, {
                data: like.toJSON()
            });
        } catch (e) {
            next(e);
        }
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async createLikeByPostId(req, res, next) {
        req.body.postId = req.params.postId;
        return this.create(req, res, next);
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async getLikesByPostId(req, res, next) {
        req.query.postId = req.params.postId;
        return this.getAll(req, res, next);
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async createLikeByCommentId(req, res, next) {
        req.body.commentId = req.params.commentId;
        return this.create(req, res, next);
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     * @return {Promise<e.Response>}
     */
    async getLikesByCommentId(req, res, next) {
        req.query.commentId = req.params.commentId;
        return this.getAll(req, res, next);
    }

    /**
     * @inheritDoc
     */
    _prepareFilters(req) {
        const filter = [];
        const allowedFilter = ['postId', 'commentId'];
        Object.keys(req.query).forEach(fieldName => {
            if (allowedFilter.includes(fieldName) && !filter.hasOwnProperty(fieldName)) {
                filter.push(new Where(fieldName, '=', req.query[fieldName]));
            }
        });

        return filter;
    }
}

module.exports = new LikeController();