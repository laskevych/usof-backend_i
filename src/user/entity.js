import Entity from "../entity.js";

class UserEntity extends Entity {
    /**
     * @param {UserModel} model
     * @param {Object} data
     */
    constructor(model, data = {}) {
        super(model, data);
    }

    toJSON(allowedAllFields = false) {
        const result = super.toJSON(allowedAllFields);
        delete result?.password;
        return result;
    }

    /**
     * @return {Promise<void>}
     */
    async increaseRating() {
        return this._changeRating(1);
    }

    /**
     * @return {Promise<void>}
     */
    async decreaseRating() {
        return this._changeRating(-1);
    }

    /**
     * @param number
     * @return {Promise<void>}
     * @private
     */
    async _changeRating(number) {
        if (this.id) {
            this.rating += number;
        }

        return this.save();
    }
}

export default UserEntity;