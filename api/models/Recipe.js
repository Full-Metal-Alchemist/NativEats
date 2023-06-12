const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../db/dbInstance');
const Cuisine = require('./Cuisine');

class Recipe extends Model {}

Recipe.init({
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  steps: {
    type: DataTypes.STRING,
  },
  photos: {
    type: DataTypes.JSON,
  },
  isVisible: {
    type: DataTypes.BOOLEAN,
  },
}, {
  sequelize,
  modelName: 'recipe',
  underscored: true,
  updatedAt: false,
});

// TODO: Fix later
// Recipe.hasMany(Cuisine);

module.exports = Recipe;
