const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../db/dbInstance');
const CuisineRestaurant = require('./CuisineRestaurant');
const Restaurant = require('./Restaurant');

class Cuisine extends Model {}

Cuisine.init({
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  about: {
    type: DataTypes.STRING,
  },
  photo: {
    type: DataTypes.STRING,
  },
  isVisible: {
    type: DataTypes.BOOLEAN,
  },
}, {
  sequelize,
  modelName: 'cuisine',
  underscored: true,
  updatedAt: false,
  createdAt: false,
});

// Fix later
// Cuisine.belongsToMany(Restaurant, { through: CuisineRestaurant });

module.exports = Cuisine;
