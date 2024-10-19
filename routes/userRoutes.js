const express = require('express');
const router = express.Router();
const userController = require('./../models/user/controller');

router.get('/',
    userController.setAccessPolicy.bind(userController),
    userController.getAll.bind(userController)
);

router.get('/:id/', userController.getById.bind(userController));
router.post('/',
    userController.setAccessPolicy.bind(userController),
    userController.validateBody.bind(userController),
    userController.create.bind(userController)
);

module.exports = router;