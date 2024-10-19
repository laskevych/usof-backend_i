const express = require('express');
const router = express.Router();
const categoryController = require('./../models/category/controller');

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

module.exports = router;