import Model from "./../../model.js";
import CategoryEntity from "../../category/entity.js";
import CategoryModel from "../../category/model.js";
import Where from "../../sql/where.js";

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
     * @return {Promise<CategoryEntity[]>}
     */
    async getCategoriesByPostId(postId) {
        const postCategories = await this.getEntities([], [
            new Where('postId', '=', postId)
        ]);

        if (postCategories.length > 0) {
            return (new CategoryModel()).getEntities([], [
                new Where('id', 'IN', postCategories.map(postCategory => postCategory.categoryId))
            ]);
        } else {
            return [];
        }
    }
}

export default PostCategoryModel;