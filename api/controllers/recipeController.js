const mockRecipes = require('../../__mocks__/mockRecipes');
const Recipe = require('../models/Recipe');

const createRecipe = async (req, res) => {
  const {
    name,
    steps,
    photos,
  } = req.body;
  const recipe = await Recipe.create({
    name,
    steps,
    photos,
  });
  res.send(recipe);
};

const getRecipes = async (req, res) => {
  const recipes = await Recipe.findAll();

  if (recipes.length) {
    res.send(recipes);
  } else {
    res.send(mockRecipes);
  }
};

const getRecipe = async (req, res) => {
  const { recipeId } = req.params;
  const recipe = await Recipe.findByPk(recipeId);

  if (recipe) {
    res.send(recipe);
  } else {
    // TODO: Fix as 404 when login is done
    res.send(mockRecipes[0]);
  }
};

const updateRecipe = async (req, res) => {
  const { recipeId } = req.params;
  await Recipe.update(req.body, {
    where: { id: recipeId },
  });
  res.send(req.body || mockRecipes[0]);
};

const deleteRecipe = async (req, res) => {
  const { recipeId } = req.params;
  await Recipe.destroy({
    where: { id: recipeId },
  });
  res.sendStatus(200);
};

module.exports = {
  createRecipe,
  getRecipes,
  getRecipe,
  updateRecipe,
  deleteRecipe,
};
