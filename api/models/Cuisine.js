const { DataTypes, Model } = require('sequelize');

module.exports = (sequelize) => {
  class Cuisine extends Model {}

  Cuisine.init({
    name: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    history: {
      type: DataTypes.TEXT,
    },
    customs: {
      type: DataTypes.TEXT,
    },
    photo: {
      type: DataTypes.TEXT,
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

  return Cuisine;
};
