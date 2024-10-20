const express = require('express');
const router = express.Router();
const UserController = require('./../models/user/controller');
const controller = new UserController();

router.get('/',
    controller.setAccessPolicy.bind(controller),
    controller.getAll.bind(controller)
);

router.get('/:id/', controller.getById.bind(controller));
router.post('/',
    controller.setAccessPolicy.bind(controller),
    controller.validateBody.bind(controller),
    controller.create.bind(controller)
);

module.exports = router;