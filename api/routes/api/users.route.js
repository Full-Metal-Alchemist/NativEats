const express = require('express');
const userController = require('../../controllers/userController');

const router = express.Router();

router
  .route('/')
  .get(userController.getPuid)
  .post(userController.createUser);

router
  .route('/:userId')
  .get(userController.getUser)
  .patch(userController.updateUser)
  .delete(userController.deleteUser);

module.exports = router;
