const express = require('express');

const router = express.Router();

router.use('/auth', require('./auth.route'));
router.use('/bookmarks', require('./bookmarks.route'));
router.use('/cuisines', require('./cuisines.route'));
router.use('/recipes', require('./recipes.route'));
router.use('/restaurants', require('./restaurants.route'));
router.use('/reviews', require('./reviews.route'));
router.use('/users', require('./users.route'));

module.exports = router;
