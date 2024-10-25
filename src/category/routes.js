import express from "express";
const router = express.Router();
import categoryController from './controller.js';
import postController from './../post/controller.js';

router.get('/',
    categoryController.setAccessPolicy.bind(categoryController),
    categoryController.getAll.bind(categoryController)
);

router.get('/:id/',
    categoryController.setAccessPolicy.bind(categoryController),
    categoryController.getById.bind(categoryController)
);

router.post('/',
    categoryController.setAccessPolicy.bind(categoryController),
    categoryController.validateBody.bind(categoryController),
    categoryController.create.bind(categoryController)
);

router.patch('/:id/',
    categoryController.setAccessPolicy.bind(categoryController),
    categoryController.validateBody.bind(categoryController),
    categoryController.update.bind(categoryController)
);

router.delete('/:id/',
    categoryController.setAccessPolicy.bind(categoryController),
    categoryController.delete.bind(categoryController)
);

router.get('/:categoryId/posts/',
    postController.setAccessPolicy.bind(postController),
    postController.getPostsByCategoryId.bind(postController)
);

export default router;