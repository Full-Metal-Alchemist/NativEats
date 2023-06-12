const express = require('express');
const bookmarkController = require('../../controllers/bookmarkController');

const router = express.Router();

router
  .route('/')
  .post(bookmarkController.createBookmark)
  .delete(bookmarkController.deleteBookmark);

module.exports = router;
