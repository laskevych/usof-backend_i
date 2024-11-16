import express from "express";
import UserController from "./controller.js";
import postController from "./../post/controller.js";
import uploadMiddleware from "./middlewares/profilePictureUploader.js";
const router = express.Router();
const controller = new UserController();

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
    controller.validateUpdate.bind(controller),
    controller.update.bind(controller)
);


router.patch('/:id/avatar/',
    controller.setAccessPolicy.bind(controller),
    uploadMiddleware,
    controller.update.bind(controller)
);


router.delete('/:id/',
    controller.setAccessPolicy.bind(controller),
    controller.delete.bind(controller)
);

router.get('/:userId/posts/',
    postController.setAccessPolicy.bind(postController),
    postController.getUserPosts.bind(postController)
);

router.get('/:userId/favorite/',
    postController.setAccessPolicy.bind(postController),
    postController.getFavoritePosts.bind(postController)
);

export default router;