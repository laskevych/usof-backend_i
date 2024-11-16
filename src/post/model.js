import Model from "../model.js";
import PostEntity from "./entity.js";
import PostCategoryModel from "./category/model.js";
import PostFavoritesModel from "./favorite/model.js";
import LikeModel from "../like/model.js";
import UserModel from "../user/model.js";
import Where from "../sql/where.js";
import CommentModel from "../comment/model.js";

class PostModel extends Model {
    /**
     * @type {{categories: PostCategoryModel, favorites: PostFavoritesModel}}
     */
    _subModels = {};

    constructor() {
        super(
            'posts',
            [
                'id',
                'title',
                'content',
                'status',
                'showOnHomepage',
                'likes',
                'creationById',
                'creationAt'
            ],
            PostEntity
        );

        this._subModels = {
            categories: new PostCategoryModel(),
            favorites: new PostFavoritesModel()
        };
    }

    /**
     * @inheritDoc
     * @return {Promise<PostEntity[]|PostEntity>}
     */
    async getEntities(fields = [], where = [], orderBy = 'id', limit = undefined, offset = undefined) {
        return super.getEntities(fields, where, orderBy, limit, offset);
    }

    /**
     * @param {number} postId
     * @return {Promise<void>}
     */
    async recalculateLikesByPostId(postId) {
        const post = await this.getEntityById(postId);
        if (!post) {
            return;
        }

        const likeModel = new LikeModel();

        let numberOfLikes = 0;
        const likes = await likeModel.getLikesByEntityId('postId', postId);
        likes.forEach(like => {
            if (like.isLike()) {
                numberOfLikes++;
            }
        });

        post.likes = numberOfLikes;
        await post.save();
    }

    /**
     * @param {number} userId
     * @return {Promise<UserEntity>}
     */
    async getAuthorById(userId) {
        return (new UserModel()).getEntityById(userId);
    }

    /**
     * @param {number} postId
     * @return {Promise<CategoryEntity[]>}
     */
    async getCategoriesByPostId(postId) {
        return this._subModels.categories.getCategoriesByPostId(postId);
    }

    /**
     *
     * @param {[Where|[Where]]} where
     */
    async _getWhere(where) {
        for (const item of where) {
            if (item.field === 'categories') {
                const postCategories = await this._subModels.categories.getEntities([], [
                    new Where('categoryId', 'IN', item.value)
                ]);

                const postIds = postCategories.map(postCategory => postCategory.postId);

                item.field = 'id';
                item.condition = 'IN';
                item.value = postIds.length === 0 ? [0] : postIds;
            }
        }

        return super._getWhere(where);
    }

    /**
     * @param {number} postId
     * @return {Promise<number>}
     */
    async getNumberOfCommentsByPostId(postId) {
        const commentModel = new CommentModel();
        const comments = await commentModel.getCommentsByPostId(postId);
        return comments.length;
    }
}

export default PostModel;