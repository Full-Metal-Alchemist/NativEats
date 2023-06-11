const mockReviews = require('../../__mocks__/mockReviews');

const createReview = async (req, res) => {
  res.sendStatus(200);
};

const getReviews = async (req, res) => {
  res.send(mockReviews);
};

const getReview = async (req, res) => {
  res.send(mockReviews[0]);
};

const updateReview = async (req, res) => {
  res.send(req.body || mockReviews[0]);
};

const deleteReview = async (req, res) => {
  res.sendStatus(200);
};

module.exports = {
  createReview,
  getReviews,
  getReview,
  updateReview,
  deleteReview,
};
