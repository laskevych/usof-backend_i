const e = require("express");
const Controller = require('./../controller');
const CategoryModel = require('./model');
const Where = require('./../sql/where');
const { body } = require("express-validator");

class CategoryController extends Controller {
    constructor() {
        super(new CategoryModel(), [
            body('title')
                .notEmpty().withMessage('Title cannot be empty'),

            body('description')
                .optional()
        ]);

        this._accessPolicies.user
            .removeCreate()
            .setRead()
            .removeUpdate()
            .removeDelete()
    }
}

module.exports = new CategoryController();