const jwt = require('jsonwebtoken');
const config = require('../../../config/app.json');
const UserModel = require('../../user/model');
const e = require("express");


function invalidCredentials(req, res, message = "Invalid token.") {
    return res.status(401).json({
        message,
        statusCode: req.statusCode
    });
}

/**
 * @param {e.Request} req
 * @param {e.Response} res
 * @param {e.NextFunction} next
 * @return {Promise<*>}
 */
exports.setUserByJWT = async (req, res, next) => {
    // req.user = undefined;
    // const model = new UserModel();
    // req.user = await model.getEntityById(-1);


    const authTokenHeader = req.headers['authorization'];
    const bearerToken = authTokenHeader && authTokenHeader.split(' ')[1];
    if (bearerToken) {
        try {
            const userData = await jwt.verify(bearerToken, config.jwtSecret);
            const model = new UserModel();
            if (userData?.id) {
                const user = await model.getEntityById(userData.id);
                if (!user) {
                    return invalidCredentials(req, res, "User not found by token");
                }

                req.user = user;
            }

        } catch (e) {
            return invalidCredentials(req, res);
        }
    }

    next();
};