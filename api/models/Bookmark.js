const { DataTypes, Model } = require('sequelize');

module.exports = (sequelize) => {
  class Bookmark extends Model {}

  Bookmark.init({
    userId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    restaurantId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
  }, {
    sequelize,
    modelName: 'bookmark',
    underscored: true,
    updatedAt: false,
    createdAt: false,
  });

  return Bookmark;
};
