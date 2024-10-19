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
    }

    async recalculateLikes() {
        if (this.id) {
            await this._model.recalculateLikesByPostId(this.id);
        }
    }
}

module.exports = PostEntity;