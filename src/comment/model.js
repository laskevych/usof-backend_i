const Model = require('./../model');
const CommentEntity = require('./entity');
const UserEntity = require('./../user/entity');
const UserModel = require('./../user/model');

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

module.exports = CommentModel;