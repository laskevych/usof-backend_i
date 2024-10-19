const Model = require('./../model');
const CommentEntity = require('./entity');

class CommentModel extends Model {
    constructor() {
        super(
            'comments',
            [
                'id',
                'postId',
                'creationById',
                'content',
                'isHelpful',
                'creationAt'
            ],
            CommentEntity
        );
    }
}

module.exports = CommentModel;