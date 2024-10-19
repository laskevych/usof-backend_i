const Model = require('./../model');
const PostEntity = require('./entity');

class PostModel extends Model {
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
    }
}

module.exports = PostModel;