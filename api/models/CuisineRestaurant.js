const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../db/dbInstance');
const Cuisine = require('./Cuisine');
const Restaurant = require('./Restaurant');

class CuisineRestaurant extends Model {}

CuisineRestaurant.init({
    cuisineId: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    restaurantId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
}, {
  sequelize,
  modelName: 'cuisine_restaurant',
  underscored: true,
  updatedAt: false,
  createdAt: false,
});

// Fix later
// CuisineRestaurant.belongsTo(Cuisine, { foreignKey: 'cuisine_id' });
// CuisineRestaurant.belongsTo(Restaurant, { foreignKey: 'restaurant_id' });

module.exports = CuisineRestaurant;
