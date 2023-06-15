const express = require('express');
const restaurantController = require('../../controllers/restaurantController');

const router = express.Router();

router
  .route('/')
  .post(restaurantController.createRestaurant)
  .get(restaurantController.getRestaurants);

router
  .route('/:restaurantId')
  .get(restaurantController.getRestaurant)
  .patch(restaurantController.updateRestaurant)
  .delete(restaurantController.deleteRestaurant);

module.exports = router;
