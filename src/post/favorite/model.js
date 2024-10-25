import Model from "../../model.js";

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

export default PostFavoritesModel;