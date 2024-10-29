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


    async syncCategories(postId, categoriesIds) {
        const postCategories = await this.getEntities([], [
            new Where('postId', '=', postId)
        ]);

        if (categoriesIds.size === 0) {
            for (const postCategory of postCategories) {
                await postCategory.delete();
            }
        } else {
            for (const postCategory of postCategories) {
                if (!categoriesIds.has(postCategory.categoryId)) {
                    await postCategory.delete();
                } else {
                    categoriesIds.delete(postCategory.categoryId);
                }
            }

            const categoryModel = new CategoryModel();
            for (const categoryId of categoriesIds) {
                const category = await categoryModel.getEntityById(categoryId);
                if (category) {
                    const postCategory = this.createEntity({
                        postId: postId,
                        categoryId: categoryId
                    });

                    await postCategory.save();
                }
            }
        }
    }
}

export default PostCategoryModel;