import Model from "../model.js";
import LikeEntity from "./entity.js";
import Where from "../sql/where.js";
import UserEntity from "../user/entity.js";
import UserModel from "../user/model.js";

class LikeModel extends Model {
    constructor() {
        super(
            'likes',
            [
                'id',
                'creationById',
                'postId',
                'commentId',
                'type',
                'postId',
                'creationAt'
            ],
            LikeEntity
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
     * @param {number} creationById
     * @param {string} entityName
     * @param {number} entityId
     * @return {Promise<LikeEntity>}
     */
    async getLikeByCreationByIdAndPostOrCommentId(creationById, entityName, entityId) {
        return this.getEntities(
            [],
            [
                new Where(this._creationByRelationFieldName, '=', creationById),
                new Where(entityName, '=', entityId)
            ],
            'id',
            1
        );
    }

    /**
     * @param {string} entityName
     * @param {number} entityId
     * @return {Promise<LikeEntity[]>}
     */
    async getLikesByEntityId(entityName, entityId) {
        return this.getEntities([], [
            new Where(entityName, '=',entityId)
        ]);
    }
}

export default LikeModel;