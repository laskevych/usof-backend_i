const express = require('express');
const router = express.Router();
const commentController = require('./controller');

router.get('/:id/',
    commentController.setAccessPolicy.bind(commentController),
    commentController.getById.bind(commentController)
);

router.post('/',
    commentController.setAccessPolicy.bind(commentController),
    commentController.validateBody.bind(commentController),
    commentController.create.bind(commentController)
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

module.exports = router;