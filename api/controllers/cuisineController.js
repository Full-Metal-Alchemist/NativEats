const mockCuisines = require('../../__mocks__/mockCuisines');
const { Cuisine } = require('../models');

const createCuisine = async (req, res) => {
  const cuisine = await Cuisine.create(req.body);
  res.send(cuisine);
};

const getCuisines = async (req, res) => {
  const { name } = req.query;
  const cuisines = await Cuisine.findAll({
    where: {
      isVisible: true,
      ...(name ? { name } : {}),
    },
    include: ['restaurants', 'recipes'],
  });

  if (cuisines.length) {
    res.send(cuisines);
  } else {
    // TODO: Fix when more data exists
    res.send(mockCuisines);
  }
};

const getCuisine = async (req, res) => {
  const { cuisineId } = req.params;
  const cuisine = await Cuisine.findByPk(cuisineId, { include: ['restaurants'] });

  if (cuisine) {
    res.send(cuisine);
  } else {
    // TODO: Fix when more data exists
    res.send(mockCuisines[0]);
  }
};

const updateCuisine = async (req, res) => {
  const { cuisineId } = req.params;
  await Cuisine.update(req.body, {
    where: { id: cuisineId },
  });
  res.send(req.body || {});
};

const deleteCuisine = async (req, res) => {
  const { cuisineId } = req.params;
  await Cuisine.destroy({
    where: { id: cuisineId },
  });
  res.sendStatus(200);
};

module.exports = {
  createCuisine,
  getCuisines,
  getCuisine,
  updateCuisine,
  deleteCuisine,
};
