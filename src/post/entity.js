import Entity from "../entity.js";

class PostEntity extends Entity {
    /**
     * @param {PostModel} model
     * @param {Object} data
     */
    constructor(model, data = {}) {
        super(model, data);

        this._publicFields.push('author', 'categories', 'numberOfComments');
    }

    async recalculateLikes() {
        if (this.id) {
            await this._model.recalculateLikesByPostId(this.id);
        }
    }

    _getRelationFields() {
        return {
            author: async () => await this._model.getAuthorById(this.creationById),
            categories: async () => await this._model.getCategoriesByPostId(this.id),
            numberOfComments: async () => await this._model.getNumberOfCommentsByPostId(this.id)
        };
    }
}

export default PostEntity;