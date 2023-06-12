const mockRestaurants = require('../../__mocks__/mockRestaurants');
const Restaurant = require('../models/Restaurant');

const createRestaurant = async (req, res) => {
  const {
    name,
    description,
    photos,
    rating,
    price,
    reviewCount,
    popularity,
    address,
    city,
    state,
    country,
    latitude,
    longitude,
  } = req.body;
  const restaurant = await Restaurant.create({
    name,
    description,
    photos,
    rating,
    price,
    reviewCount,
    popularity,
    address,
    city,
    state,
    country,
    latitude,
    longitude,
  });
  res.send(restaurant);
};

const getRestaurants = async (req, res) => {
  // TODO: add category
  const { category = 'createdAt', order = 'DESC', limit = 50 } = req.query;
  const restaurants = await Restaurant.findAll({
    where: {
      isVisible: true,
    },
    order: [
      [category, order],
    ],
    limit,
  });

  if (restaurants.length) {
    res.send(restaurants);
  } else {
    res.send(mockRestaurants);
  }
};

const getRestaurant = async (req, res) => {
  const { restaurantId } = req.params;
  const restaurant = await Restaurant.findByPk(restaurantId);
  if (restaurant) {
    res.send(restaurant);
  } else {
    res.send(mockRestaurants[0]);
  }
};

const updateRestaurant = async (req, res) => {
  const { restaurantId } = req.params;
  await Restaurant.update(req.body, {
    where: { id: restaurantId },
  });
  res.send(req.body || mockRestaurants[0]);
};

const deleteRestaurant = async (req, res) => {
  const { restaurantId } = req.params;
  await Restaurant.destroy({
    where: { id: restaurantId },
  });
  res.sendStatus(200);
};

module.exports = {
  createRestaurant,
  getRestaurants,
  getRestaurant,
  updateRestaurant,
  deleteRestaurant,
};
