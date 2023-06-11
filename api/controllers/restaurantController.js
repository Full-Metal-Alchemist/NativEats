const mockRestaurants = require('../../__mocks__/mockRestaurants');

const createRestaurant = async (req, res) => {
  res.sendStatus(200);
};

const getRestaurants = async (req, res) => {
  res.send(mockRestaurants);
};

const getRestaurant = async (req, res) => {
  res.send(mockRestaurants[0]);
};

const updateRestaurant = async (req, res) => {
  res.send(req.body || mockRestaurants[0]);
};

const deleteRestaurant = async (req, res) => {
  res.sendStatus(200);
};

module.exports = {
  createRestaurant,
  getRestaurants,
  getRestaurant,
  updateRestaurant,
  deleteRestaurant,
};
