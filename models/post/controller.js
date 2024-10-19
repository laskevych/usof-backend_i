const Controller = require('./../controller');
const PostModel = require('./model');
const Where = require('./../sql/where');
const { body } = require("express-validator");

class PostController extends Controller {
    constructor() {
        super(new PostModel(), [
            body('title')
                .notEmpty().withMessage('Title cannot be empty'),

            body('content')
                .notEmpty().withMessage('Content cannot be empty')
        ]);

        this._totalEntitiesPerPage = 5;

        const allowedFieldsForUser = this._model._fields.filter(field => !['likes', 'isTop', 'showOnHomepage'].includes(field))
        this._accessPolicies.user
            .setCreate(allowedFieldsForUser)
            .setRead([], [
                [
                    { field: 'status', operator: '=', value: 'active' },
                    { field: this._model._creationByRelationFieldName, operator: '=', value: ''}
                ]
            ])
            .setUpdate(allowedFieldsForUser, [ { field: this._model._creationByRelationFieldName, operator: '=', value: ''} ])
            .setDelete(allowedFieldsForUser, [ { field: this._model._creationByRelationFieldName, operator: '=', value: ''} ])
    }
}

module.exports = new PostController();