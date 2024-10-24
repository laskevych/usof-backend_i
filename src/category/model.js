const Model = require('./../model');
const CategoryEntity = require('./entity');
const Where = require('./../sql/where');
const PostFavoritesModel = require("../post/favorite/model");

class CategoryModel extends Model {
    constructor() {
        super(
            'categories',
            [
                'id',
                'title',
                'description',
                'creationAt'
            ],
            CategoryEntity
        );
    }

    async getCategoriesByPostId(postId) {
        const PostCategoryModel = require('./../post/category/model');
        const postCategories = await (new PostCategoryModel()).getEntities([], [
            new Where(
                'postId',
                '=',
                postId
            )
        ]);

        return this.getEntities([], [
            new Where(
                'id',
                'IN',
                postCategories.map(postCategory => postCategory.categoryId)
            )
        ]);
    }
}

module.exports = CategoryModel;