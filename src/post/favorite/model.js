import Model from "../../model.js";
import Where from "../../sql/where.js";

class PostFavoritesModel extends Model {
    constructor() {
        super(
            'posts_favorites',
            [
                'id',
                'creationById',
                'postId',
                'creationAt'
            ]
        );
    }

    /**
     * @param {number} userId
     * @return {Promise<*[number]>}
     */
    async getPostIdsByUserId(userId) {
        const entities = await this.getEntities([], [
            new Where(this._creationByRelationFieldName, '=', userId)
        ]);

        return entities.map(record => record.postId);
    }
}

export default PostFavoritesModel;