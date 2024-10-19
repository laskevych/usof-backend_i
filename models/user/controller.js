const Controller = require('./../controller');
const UserModel = require('./model');
const Where = require('./../sql/where');
const { body } = require("express-validator");

class UserController extends Controller {
    constructor() {
        super(new UserModel(), [
            body('login')
                .notEmpty().withMessage('Login cannot be empty'),

            body('email')
                .notEmpty().withMessage('Email cannot be empty')
                .isEmail().withMessage('Must be a valid email'),
        ]);

        this._totalEntitiesPerPage = 5;

        this._accessPolicies.admin.setUpdate(this._model._fields.filter(field => !['email', 'login', 'rating'].includes(field)))

        this._accessPolicies.user
            .removeCreate()
            .setRead(this._model._fields.filter(field => !['password'].includes(field)))
            .setUpdate(this._model._fields.filter(field => !['email', 'login', 'role', 'rating', 'isEmailVerified'].includes(field)));
    }

    /**
     * @param {e.Request} req
     * @param {e.Response} res
     * @param {e.NextFunction} next
     */
    async setAccessPolicy(req, res, next= undefined) {
        await super.setAccessPolicy(req, res);

        if (
            (req.method === 'PATCH' || req.method === 'DELETE')
            && req.accessOperation
            && req?.user?.role === 'user'
        ) {
            req.accessOperation.filter = [
                new Where('id', '=', req.user.id)
            ];
        }

        next();
    }
}

module.exports = new UserController();