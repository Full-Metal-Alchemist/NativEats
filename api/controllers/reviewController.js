const mockReviews = require('../../__mocks__/mockReviews');
const Review = require('../models/Review');

const createReview = async (req, res) => {
  const {
    comment,
    photos,
    rating,
  } = req.body;
  const review = await Review.create({
    comment,
    photos,
    rating,
  });
  res.send(review);
};

const getReviews = async (req, res) => {
  const reviews = await Review.findAll();

  if (reviews.length) {
    res.send(reviews);
  } else {
    // TODO: Fix when more data exists
    res.send(mockReviews);
  }
};

const getReview = async (req, res) => {
  const { reviewId } = req.params;
  const review = await Review.findByPk(reviewId);

  if (review) {
    res.send(review);
  } else {
    // TODO: Fix when more data exists
    res.send(mockReviews[0]);
  }
};

const updateReview = async (req, res) => {
  const { reviewId } = req.params;
  await Review.update(req.body, {
    where: { id: reviewId },
  });
  res.send(req.body || {});
};

const deleteReview = async (req, res) => {
  const { reviewId } = req.params;
  await Review.destroy({
    where: { id: reviewId },
  });
  res.sendStatus(200);
};

module.exports = {
  createReview,
  getReviews,
  getReview,
  updateReview,
  deleteReview,
};
