const Model = require('./../model');
const CategoryEntity = require('./entity');

class CategoryModel extends Model {
    constructor() {
        super(
            'categories',
            [
                'id',
                'title',
                'description',
                'creationAt'
            ],
            CategoryEntity
        );
    }
}

module.exports = CategoryModel;