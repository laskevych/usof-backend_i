import express from "express";
const router = express.Router();

import postController from './controller.js';
import categoryController from './../category/controller.js';
import commentController from './../comment/controller.js';
import likeController from './../like/controller.js';

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

router.get('/:postId/comments',
    commentController.setAccessPolicy.bind(commentController),
    commentController.getCommentsByPostId.bind(commentController)
);

router.post('/:postId/comments',
    commentController.setAccessPolicy.bind(commentController),
    commentController.createCommentByPostId.bind(commentController)
);

router.get('/:postId/like/',
    likeController.setAccessPolicy.bind(likeController),
    likeController.getLikesByPostId.bind(likeController)
);

router.post('/:postId/like/',
    likeController.setAccessPolicy.bind(likeController),
    likeController.validateBody.bind(likeController),
    likeController.createLikeByPostId.bind(likeController)
);

router.delete('/:postId/like/:id/',
    likeController.setAccessPolicy.bind(likeController),
    likeController.delete.bind(likeController)
);

export default router;