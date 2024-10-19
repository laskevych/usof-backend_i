const Model = require('./../../model');

class PostCategoryModel extends Model {
    constructor() {
        super(
            'posts_categories',
            [
                'id',
                'postId',
                'categoryId',
                'creationAt'
            ]
        );
    }
}

module.exports = PostCategoryModel;