const Model = require('./../model');
const PostEntity = require('./entity');
const PostCategoryModel = require('./category/model');
const PostFavoritesModel = require('./favorite/model');

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
     *
     * @param {[Where|[Where]]} where
     * @private
     * @todo
     */
    // _getWhere(where) {
    //     for (const filter of where) {
    //         if (filter.field === 'categories') {
    //             const postCategory = new PostCategoryModule();
    //             const postCategories = await postCategory.getRecords([
    //                 {
    //                     field: 'categoryId',
    //                     condition: 'IN',
    //                     value: filter.value
    //                 }
    //             ]);
    //
    //             const postIds = postCategories.map(postCategory => postCategory.postId);
    //
    //             filter.field = 'id';
    //             filter.condition = 'IN';
    //             filter.value = postIds.length === 0 ? [0] : postIds;
    //         }
    //     }
    //
    //     return super._getWhere(where);
    // }
}

module.exports = PostModel;