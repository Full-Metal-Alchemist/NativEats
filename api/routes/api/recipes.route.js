const express = require('express');
const recipeController = require('../../controllers/recipeController');

const router = express.Router();

router
  .route('/')
  .post(recipeController.createRecipe)
  .get(recipeController.getRecipes);

router
  .route('/:recipeId')
  .get(recipeController.getRecipe)
  .patch(recipeController.updateRecipe)
  .delete(recipeController.deleteRecipe);

module.exports = router;
