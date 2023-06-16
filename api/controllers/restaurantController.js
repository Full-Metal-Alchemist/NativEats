const axios = require('axios');
const { Op } = require('sequelize');
const axios = require('axios');
const { Op } = require('sequelize');
const mockRestaurants = require('../../__mocks__/mockRestaurants');
const { Restaurant } = require('../models');
const { Cuisine } = require('../models');
const { Cuisine } = require('../models');

const createRestaurant = async (req, res) => {
  const restaurant = await Restaurant.create(req.body);
  res.send(restaurant);
};

const getRestaurants = async (req, res) => {
  console.log('12', req.query);
  console.log('12', req.query);
  // TODO: add category
  const {
    category = 'created_at', order = 'DESC', cuisine = 2, limit = 10, search = '',
  } = req.query;
  // const { category, order, cuisine } = req.query;
  console.log('lin 16', category, order, cuisine);
  // const restaurants = await Restaurant.findAll({
  //   where: {
  //     isVisible: true,
  //   },
  //   order: [
  //     [category, order],
  //   ],
  //   limit,
  //   include: ['cuisines', 'reviews'],
  // });

  const {
    category = 'created_at', order = 'DESC', cuisine = 2, limit = 10, search = '',
  } = req.query;
  // const { category, order, cuisine } = req.query;
  console.log('lin 16', category, order, cuisine);
  // const restaurants = await Restaurant.findAll({
  //   where: {
  //     isVisible: true,
  //   },
  //   order: [
  //     [category, order],
  //   ],
  //   limit,
  //   include: ['cuisines', 'reviews'],
  // });

  const restaurants = await Restaurant.findAll({
    where: {
      [Op.or]: [
        { name: { [Op.like]: `%${search}%` } },
      ],
      [Op.or]: [
        { name: { [Op.like]: `%${search}%` } },
      ],
    },
    order: [
      [category, order],
    ],
    limit,
    include: [{ model: Cuisine, as: 'cuisines', where: { id: cuisine } }, 'reviews'],
    include: [{ model: Cuisine, as: 'cuisines', where: { id: cuisine } }, 'reviews'],
  });
  if (restaurants.length) {
    res.send(restaurants);
  } else {
    res.send(mockRestaurants);
  }
};

const getRestaurant = async (req, res) => {
  const { restaurantId } = req.params;
  const restaurant = await Restaurant.findByPk(restaurantId, {include: ['cuisines', 'reviews']});
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
