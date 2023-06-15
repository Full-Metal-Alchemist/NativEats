const axios = require('axios');
const mockRestaurants = require('../../__mocks__/mockRestaurants');
const { Restaurant } = require('../models');
const { Cuisine } = require('../models');

const createRestaurant = async (req, res) => {
  const restaurant = await Restaurant.create(req.body);
  res.send(restaurant);
};

const getRestaurants = async (req, res) => {
  // TODO: add category
  // const { category = 'createdAt', order = 'DESC', limit = 50 } = req.query;
  const { category, order, cuisine } = req.query;
  console.log(category, order, cuisine);
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
      isVisible: true,
    },
    order: [
      [category, order],
    ],
    include: [{ model: Cuisine, as: 'cuisines', where: { id: cuisine } }, 'reviews'],
  });

  if (restaurants.length) {
    res.send(restaurants);
  } else {
    res.send(mockRestaurants);
  }
};

const getRestaurant = async (req, res) => {
  const { APIID } = req.params;
  const endpoint = `https://api.yelp.com/v3/businesses/${APIID}`;
  const option = {
    method: 'GET',
    url: endpoint,
    headers: {
      Authorization: `Bearer ${process.env.TOKEN}`,
    },
  };

  axios(option)
    .then((result) => {
      res.send(result.data);
    })
    .catch((err) => { console.log(err); });

  // if (restaurant) {
  //   res.send(restaurant);
  // } else {
  //   res.send(mockRestaurants[0]);
  // }
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
