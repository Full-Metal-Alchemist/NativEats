const axios = require('axios');
const { Op } = require('sequelize');
const mockRestaurants = require('../../__mocks__/mockRestaurants');
const { Restaurant } = require('../models');
const { Cuisine } = require('../models');

const createRestaurant = async (req, res) => {
  const restaurant = await Restaurant.create(req.body);
  res.send(restaurant);
};

const getRestaurants = async (req, res) => {
  const {
    category = 'created_at', order = 'DESC', cuisine, limit = 10, search, tags,
  } = req.query;
  const restaurants = await Restaurant.findAll({
    where: {
      isVisible: true,
      ...(search ? {
        name: {
          [Op.iLike]: `%${search}%`,
        },
      } : {}),
      ...(tags ? {
        tags: {
          [Op.contains]: tags,
        },
      } : {}),
    },
    order: [
      [category, order],
    ],
    limit,
    include: [
      {
        model: Cuisine,
        as: 'cuisines',
        ...(cuisine ? {
          where: {
            id: cuisine,
          },
        } : {}),
      },
      'reviews',
    ],
  });

  res.send(restaurants);
};

const getRestaurant = async (req, res) => {
  const { restaurantId } = req.params;
  const restaurant = await Restaurant.findByPk(restaurantId, { include: ['cuisines', 'reviews'] });
  if (restaurant) {
    res.send(restaurant);
  } else {
    res.sendStatus(404);
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
