const Model = require('./../../model');

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
}

module.exports = PostFavoritesModel;