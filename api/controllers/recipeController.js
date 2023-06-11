const mockRecipes = require('../../__mocks__/mockRecipes');

const createRecipe = async (req, res) => {
  res.sendStatus(200);
};

const getRecipes = async (req, res) => {
  res.send(mockRecipes);
};

const getRecipe = async (req, res) => {
  res.send(mockRecipes[0]);
};

const updateRecipe = async (req, res) => {
  res.send(req.body || mockRecipes[0]);
};

const deleteRecipe = async (req, res) => {
  res.sendStatus(200);
};

module.exports = {
  createRecipe,
  getRecipes,
  getRecipe,
  updateRecipe,
  deleteRecipe,
};
