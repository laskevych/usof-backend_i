const Controller = require('./../controller');
const UserModel = require('./model');
const Where = require('./../sql/where');
const { body } = require("express-validator");

/**
 * @property {UserModel} _model
 */
class UserController extends Controller {
    constructor() {
        super(new UserModel(),
            [
                body('login')
                    .notEmpty().withMessage('Please provide a login.')
                    .isLength({ min: 4 }).withMessage('Login must contain at least 4 characters.')
                    .isLowercase().withMessage('Login should be in lowercase letters only.'),

                body('email')
                    .notEmpty().withMessage('Email address is required.')
                    .isEmail().withMessage('Please enter a valid email address.'),

                body('fullName')
                    .notEmpty().withMessage('Full name is required.')
                    .isLength({ min: 3 }).withMessage('Full name should be at least 3 characters long.'),

                body('password')
                    .isStrongPassword({ minLength: 5 })
                    .withMessage("Password should be at least 5 characters long and include an uppercase letter, a symbol, and a number."),

                body('password_confirm')
                    .notEmpty().withMessage('Please confirm your password.')
                    .custom((value, { req }) => {
                        if (value !== req.body.password) {
                            throw new Error('Password confirmation does not match the password.');
                        }
                        return true;
                    })
            ]
        );

        this._totalEntitiesPerPage = 5;

        this._accessPolicies.admin.setUpdate(this._model._fields.filter(field => !['email', 'login', 'rating'].includes(field)))

        this._accessPolicies.user
            .removeCreate()
            .setRead(this._model._fields.filter(field => !['password'].includes(field)))
            .setUpdate(this._model._fields.filter(field => !['email', 'login', 'role', 'rating', 'isEmailVerified'].includes(field)));
    }

    /**
     * @inheritDoc
     */
    async create(req, res, next) {
        try {
            const validationErrors = [];

            let user = await this._model.getByLogin(req?.body?.login);
            if (user) {
                validationErrors.push({ path: 'login', msg: 'Login is exist.' });
            }

            user = await this._model.getByEmail(req?.body?.email);
            if (user) {
                validationErrors.push({ path: 'email', msg: 'Email is exist.' });
            }

            if (validationErrors.length > 0) {
                return this._returnResponse(
                    res,
                    400,
                    {
                        validationErrors,
                        validationSuccesses: req.validationSuccesses
                    },
                    "Validation failed"
                );
            }

            const fields = this._prepareFields(req);
            if (fields.password) {
                fields.password = await this._model.createPassword(fields.password);
            }

            console.log(fields);

            const newUser = this._model.createEntity(fields);
            await newUser.save();

            req.newUser = newUser.toJSON();

            return res.status(201).json({
                data: newUser.toJSON(),
            });
        } catch (error) {
            next(error);
        }
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

module.exports = UserController;