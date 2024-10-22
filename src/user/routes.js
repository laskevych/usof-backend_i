const express = require('express');
const router = express.Router();
const UserController = require('./controller');
const controller = new UserController();
const profilePictureUploaderMiddleware = require('./middlewares/profilePictureUploader');

router.get('/',
    controller.setAccessPolicy.bind(controller),
    controller.getAll.bind(controller)
);

router.get('/:id/',
    controller.setAccessPolicy.bind(controller),
    controller.getById.bind(controller)
);
router.post('/',
    controller.setAccessPolicy.bind(controller),
    controller.validateBody.bind(controller),
    controller.create.bind(controller)
);

router.patch('/:id/',
    controller.setAccessPolicy.bind(controller),
    controller.validateBody.bind(controller),
    controller.update.bind(controller)
);


router.patch('/:id/avatar/',
    controller.setAccessPolicy.bind(controller),
    profilePictureUploaderMiddleware.upload,
    controller.update.bind(controller)
);


router.delete('/:id/',
    controller.setAccessPolicy.bind(controller),
    controller.delete.bind(controller)
);

module.exports = router;