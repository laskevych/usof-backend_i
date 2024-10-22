const Entity = require('./../entity');
const PostModel = require('./model');

/**
 * @property {PostModel} _model
 */
class PostEntity extends Entity {
    /**
     * @param {PostModel} model
     * @param {Object} data
     */
    constructor(model, data = {}) {
        super(model, data);

        this._publicFields.push('author', 'categories');
    }

    async recalculateLikes() {
        if (this.id) {
            await this._model.recalculateLikesByPostId(this.id);
        }
    }

    _getRelationFields() {
        return {
            author: async () => await this._model.getAuthorById(this.creationById),
            categories: async () => await this._model.getCategoriesByPostId(this.id)
        };
    }
}

module.exports = PostEntity;