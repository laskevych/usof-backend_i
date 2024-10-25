import Model from "../model.js";
import CommentEntity from "./entity.js";
import UserEntity from "../user/entity.js";
import UserModel from "../user/model.js";

class CommentModel extends Model {
    constructor() {
        super(
            'comments',
            [
                'id',
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
}

export default CommentModel;