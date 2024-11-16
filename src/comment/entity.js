import Entity from "../entity.js";

class CommentEntity extends Entity {
    /**
     * @param {CommentModel} model
     * @param {Object} data
     */
    constructor(model, data = {}) {
        super(model, data);

        this._publicFields.push('author', 'comments');
    }

    _getRelationFields() {
        return {
            author: async () => await this._model.getAuthorById(this.creationById),
            comments: async () => await this._model.getSubCommentsByCommentId(this.id),
        };
    }
}

export default CommentEntity;