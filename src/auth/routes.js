const express = require('express');
const router = express.Router();
const authController = require('./controller');

router.post('/register',
    authController.setAccessPolicy.bind(authController),
    authController.checkAccess.bind(authController),
    authController.validateBody.bind(authController),
    authController.create.bind(authController)
);

router.post('/login',
    authController.setAccessPolicy.bind(authController),
    authController.checkAccess.bind(authController),
    authController.validateLogin.bind(authController),
    authController.login.bind(authController)
);

router.post('/confirm-email/:token/',
    authController.setAccessPolicy.bind(authController),
    authController.checkAccess.bind(authController),
    authController.confirmEmail.bind(authController)
);

router.post('/password-reset/',
    authController.setAccessPolicy.bind(authController),
    authController.checkAccess.bind(authController),
    authController.validatePasswordReset.bind(authController),
    authController.passwordReset.bind(authController)
);

router.post('/password-reset/:token/',
    authController.setAccessPolicy.bind(authController),
    authController.checkAccess.bind(authController),
    authController.validatePasswordConfirm.bind(authController),
    authController.confirmPasswordReset.bind(authController)
);

router.post('/logout',
    authController.setAccessPolicy.bind(authController),
    authController.logout.bind(authController)
);

module.exports = router;