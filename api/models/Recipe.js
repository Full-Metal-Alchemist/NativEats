const { DataTypes, Model } = require('sequelize');

module.exports = (sequelize) => {
  class Recipe extends Model {}

  Recipe.init({
    name: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    steps: {
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
    modelName: 'recipe',
    underscored: true,
    updatedAt: false,
  });

  return Recipe;
};
