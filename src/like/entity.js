const Entity = require('./../entity');

class LikeEntity extends Entity {
    /**
     * @param {LikeModel} model
     * @param {Object} data
     */
    constructor(model, data = {}) {
        super(model, data);

        this._publicFields.push('author');
    }

    isLike() {
        return this.type === 'like';
    }

    _getRelationFields() {
        return {
            author: async () => await this._model.getAuthorById(this.creationById)
        };
    }
}

module.exports = LikeEntity;