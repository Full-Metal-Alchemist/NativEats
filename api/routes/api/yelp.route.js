const express = require('express');
const yelpController = require('../../controllers/yelpController');

const router = express.Router();

router
  .route('/:yelpId')
  .get(yelpController.getRestaurant);

module.exports = router;
