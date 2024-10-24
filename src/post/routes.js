const express = require('express');
const router = express.Router();
const postController = require('./controller');
const categoryController = require('./../category/controller');

router.get('/',
    postController.setAccessPolicy.bind(postController),
    postController.getAll.bind(postController)
);

router.get('/:id/',
    postController.setAccessPolicy.bind(postController),
    postController.getById.bind(postController)
);

router.post('/',
    postController.setAccessPolicy.bind(postController),
    postController.validateBody.bind(postController),
    postController.create.bind(postController)
);

router.patch('/:id/',
    postController.setAccessPolicy.bind(postController),
    postController.validateBody.bind(postController),
    postController.update.bind(postController)
);

router.delete('/:id/',
    postController.setAccessPolicy.bind(postController),
    postController.delete.bind(postController)
);

router.get('/:postId/categories',
    categoryController.setAccessPolicy.bind(categoryController),
    categoryController.getCategoriesByPostId.bind(categoryController)
);

module.exports = router;