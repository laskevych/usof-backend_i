const Model = require('./../model');
const PostEntity = require('./entity');
const PostCategoryModel = require('./category/model');
const PostFavoritesModel = require('./favorite/model');
const LikeModel = require('./../like/model');
const UserEntity = require('./../user/entity');
const UserModel = require('./../user/model');
const Where = require("../sql/where");

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
}

module.exports = PostModel;