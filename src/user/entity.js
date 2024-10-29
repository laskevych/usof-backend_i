import Entity from "../entity.js";

class UserEntity extends Entity {
    /**
     * @param {UserModel} model
     * @param {Object} data
     */
    constructor(model, data = {}) {
        super(model, data);
    }

    isAdmin() {
        return this.role === 'admin';
    }

    toJSON(allowedAllFields = false) {
        const result = super.toJSON(allowedAllFields);
        delete result?.password;
        return result;
    }

    /**
     * @return {Promise<void>}
     */
    async recalculateRating() {
        if (this.id) {
            await this._model.recalculateRatingByUserId(this.id);
        }
    }
}

export default UserEntity;