const mockReviews = require('../../__mocks__/mockReviews');
const {Review} = require('../models');

const createReview = async (req, res) => {
  const review = await Review.create(req.body);
  res.send(review);
};

const getReviews = async (req, res) => {
  const { category = 'createdAt', order = 'DESC', limit = 50, restaurantId, userId } = req.query;
  const reviews = await Review.findAll({
    where: {
      isVisible: true,
      ...(restaurantId ? { restaurantId } : {}),
      ...(userId ? { userId } : {}),
    },
    order: [
      [category, order],
    ],
    limit,
    include: ['user', 'restaurant'],
  });

  if (reviews.length) {
    res.send(reviews);
  } else {
    // TODO: Fix when more data exists
    res.send(mockReviews);
  }
};

const getReview = async (req, res) => {
  const { reviewId } = req.params;
  const review = await Review.findByPk(reviewId, {include: ['user', 'restaurant']});

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
