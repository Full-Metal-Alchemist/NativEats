const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../db/dbInstance');
const Restaurant = require('./Restaurant');
const User = require('./User');

class Review extends Model {}

Review.init({
  rating: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  comment: {
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
  modelName: 'review',
  underscored: true,
});

// TODO: Figure out later
// Review.belongsTo(Restaurant, { foreignKey: 'restaurant_id' });
// Review.belongsTo(User, { foreignKey: 'user_id' });

module.exports = Review;
