import Entity from "../entity.js";

class CommentEntity extends Entity {
    /**
     * @param {CommentModel} model
     * @param {Object} data
     */
    constructor(model, data = {}) {
        super(model, data);

        this._publicFields.push('author');
    }

    _getRelationFields() {
        return {
            author: async () => await this._model.getAuthorById(this.creationById)
        };
    }
}

export default CommentEntity;