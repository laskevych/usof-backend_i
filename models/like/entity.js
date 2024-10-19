const Entity = require('./../entity');

class LikeEntity extends Entity {
    isLike() {
        return this.type === 'like';
    }
}

module.exports = LikeEntity;