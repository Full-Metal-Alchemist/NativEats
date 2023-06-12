const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../db/dbInstance');
const Cuisine = require('./Cuisine');
const CuisineRestaurant = require('./CuisineRestaurant');
const Review = require('./Review');

class Restaurant extends Model {}

Restaurant.init({
  name: {
    type: DataTypes.STRING,
  },
  description: {
    type: DataTypes.STRING,
  },
  photos: {
    type: DataTypes.JSON,
  },
  rating: {
    type: DataTypes.DECIMAL,
  },
  price: {
    type: DataTypes.STRING,
  },
  reviewCount: {
    type: DataTypes.INTEGER,
  },
  popularity: {
    type: DataTypes.INTEGER,
  },
  address: {
    type: DataTypes.STRING,
  },
  city: {
    type: DataTypes.STRING,
  },
  state: {
    type: DataTypes.STRING,
  },
  country: {
    type: DataTypes.STRING,
  },
  latitude: {
    type: DataTypes.GEOMETRY,
  },
  longitude: {
    type: DataTypes.GEOMETRY,
  },
  isVisible: {
    type: DataTypes.BOOLEAN,
  },
}, {
  sequelize,
  modelName: 'restaurant',
  underscored: true,
  updatedAt: false,
});

// Fix later
// Restaurant.belongsToMany(Cuisine, { through: CuisineRestaurant, foreignKey: 'restaurant_id' });
Restaurant.hasMany(Review);

module.exports = Restaurant;
