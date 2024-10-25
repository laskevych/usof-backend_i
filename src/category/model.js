import Model from "../model.js";
import CategoryEntity from "./entity.js";
import Where from "../sql/where.js";
import PostFavoritesModel from "../post/favorite/model.js";

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

    // async getCategoriesByPostId(postId) {
    //     const PostCategoryModel = require('./../post/category/model');
    //     const postCategories = await (new PostCategoryModel()).getEntities([], [
    //         new Where(
    //             'postId',
    //             '=',
    //             postId
    //         )
    //     ]);
    //
    //     return this.getEntities([], [
    //         new Where(
    //             'id',
    //             'IN',
    //             postCategories.map(postCategory => postCategory.categoryId)
    //         )
    //     ]);
    // }
}

export default CategoryModel;