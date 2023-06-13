const { DataTypes, Model } = require('sequelize');

module.exports = (sequelize) => {
  class Review extends Model {}

  Review.init({
    userId: {
      type: DataTypes.INTEGER,
    },
    restaurantId: {
      type: DataTypes.INTEGER,
    },
    rating: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    comment: {
      type: DataTypes.TEXT,
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

  return Review;
};
