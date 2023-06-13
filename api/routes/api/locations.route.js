const express = require('express');
const locationController = require('../../controllers/locationController');

const router = express.Router();

router
  .route('/')
  .get(locationController.autocomplete);

module.exports = router;
