const Model = require('./../../model');
const Category = require('./../../category/entity');
const CategoryModel = require('./../../category/model');
const Where = require('./../../sql/where');

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

    /**
     * @param {number} postId
     * @return {Promise<Category[]>}
     */
    async getCategoriesByPostId(postId) {
        const postCategories = await this.getEntities([], [
            new Where('postId', '=', postId)
        ]);

        return (new CategoryModel()).getEntities([], [
            new Where('id', 'IN', postCategories.map(postCategory => postCategory.categoryId))
        ]);
    }
}

module.exports = PostCategoryModel;