const Model = require('./../model');
const UserEntity = require('./entity');

class UserModel extends Model {
    constructor() {
        super(
            'users',
            [
                'id',
                'login',
                'fullName',
                'password',
                'email',
                'isVerified',
                'profilePicture',
                'rating',
                'role',
                'creationAt'
            ],
            UserEntity
        );
    }
}

module.exports = UserModel;