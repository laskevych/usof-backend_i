import Model from "../model.js";
import CommentEntity from "./entity.js";
import UserEntity from "../user/entity.js";
import UserModel from "../user/model.js";
import Where from "../sql/where.js";

class CommentModel extends Model {
    constructor() {
        super(
            'comments',
            [
                'id',
                'commentId',
                'postId',
                'creationById',
                'content',
                'isHelpful',
                'status',
                'creationAt'
            ],
            CommentEntity
        );
    }

    /**
     * @param {number} userId
     * @return {Promise<UserEntity>}
     */
    async getAuthorById(userId) {
        return (new UserModel()).getEntityById(userId);
    }

    /**
     * @param {number} postId
     * @return {Promise<Entity[]|Entity>}
     */
    async getCommentsByPostId(postId) {
        return this.getEntities([], [
            new Where('postId', '=', postId)
        ]);
    }

    /**
     * @param {number} commentId
     * @return {Promise<Entity[]|Entity>}
     */
    async getSubCommentsByCommentId(commentId) {
        return this.getEntities([], [
            new Where('commentId', '=', commentId)
        ]);
    }
}

export default CommentModel;