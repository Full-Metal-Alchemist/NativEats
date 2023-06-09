const express = require('express');
const reviewController = require('../../controllers/reviewController');

const router = express.Router();

router
  .route('/')
  .post(reviewController.createReview)
  .get(reviewController.getReviews);

router
  .route('/:reviewId')
  .get(reviewController.getReview)
  .patch(reviewController.updateReview)
  .delete(reviewController.deleteReview);

module.exports = router;
