const express = require('express');
const cuisineController = require('../../controllers/cuisineController');

const router = express.Router();

router
  .route('/')
  .post(cuisineController.createCuisine)
  .get(cuisineController.getCuisines);

router
  .route('/:cuisineId')
  .get(cuisineController.getCuisine)
  .patch(cuisineController.updateCuisine)
  .delete(cuisineController.deleteCuisine);

module.exports = router;
