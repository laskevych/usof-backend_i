const Model = require('./../model');
const UserEntity = require('./entity');
const Where = require('./../sql/where');
const argon2 = require('argon2');
const config = require('./../../config/app.json');

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

    /**
     * @param {string} login
     * @return {Promise<UserEntity>}
     */
    async getByLogin(login) {
        return this.getEntities([], [ new Where('login', '=', login) ], 'id', 1);
    }

    /**
     * @param {string} email
     * @return {Promise<UserEntity>}
     */
    async getByEmail(email) {
        return this.getEntities([], [ new Where('email', '=', email) ], 'id', 1);
    }

    /**
     * @param {string} password
     * @param {string} passwordHash
     * @return {Promise<boolean>}
     */
    async isValidPassword(password, passwordHash) {
        return await argon2.verify(passwordHash, password);
    }

    /**
     * @param {string} password
     * @return {Promise<String>}
     */
    async createPassword(password) {
        return await argon2.hash(password, { salt: Buffer.from(config.salt) });
    }
}

module.exports = UserModel;