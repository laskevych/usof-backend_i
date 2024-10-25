import express from "express";
const router = express.Router();
import commentController from './controller.js';
import likeController from './../like/controller.js'

router.get('/',
    commentController.setAccessPolicy.bind(commentController),
    commentController.getAll.bind(commentController)
);

router.get('/:id/',
    commentController.setAccessPolicy.bind(commentController),
    commentController.getById.bind(commentController)
);

router.patch('/:id/',
    commentController.setAccessPolicy.bind(commentController),
    commentController.validateBody.bind(commentController),
    commentController.update.bind(commentController)
);

router.delete('/:id/',
    commentController.setAccessPolicy.bind(commentController),
    commentController.delete.bind(commentController)
);

router.patch('/:id/setHelpful/',
    commentController.setAccessPolicy.bind(commentController),
    commentController.setHelpful.bind(commentController)
);

router.get('/:commentId/like/',
    likeController.setAccessPolicy.bind(likeController),
    likeController.getLikesByCommentId.bind(likeController)
);

router.post('/:commentId/like/',
    likeController.setAccessPolicy.bind(likeController),
    likeController.validateBody.bind(likeController),
    likeController.createLikeByCommentId.bind(likeController)
);

router.delete('/:commentId/like/:id/',
    likeController.setAccessPolicy.bind(likeController),
    likeController.delete.bind(likeController)
);

export default router;