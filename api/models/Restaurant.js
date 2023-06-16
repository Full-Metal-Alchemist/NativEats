const { DataTypes, Model } = require('sequelize');

module.exports = (sequelize) => {
  class Restaurant extends Model {}

  Restaurant.init({
    name: {
      type: DataTypes.TEXT,
    },
    description: {
      type: DataTypes.TEXT,
    },
    photos: {
      type: DataTypes.JSON,
    },
    rating: {
      type: DataTypes.DECIMAL,
    },
    price: {
      type: DataTypes.TEXT,
    },
    reviewCount: {
      type: DataTypes.INTEGER,
    },
    popularity: {
      type: DataTypes.INTEGER,
    },
    address: {
      type: DataTypes.TEXT,
    },
    city: {
      type: DataTypes.TEXT,
    },
    zip: {
      type: DataTypes.TEXT,
    },
    state: {
      type: DataTypes.TEXT,
    },
    country: {
      type: DataTypes.TEXT,
    },
    latitude: {
      type: DataTypes.TEXT,
    },
    longitude: {
      type: DataTypes.TEXT,
    },
    isVisible: {
      type: DataTypes.BOOLEAN,
    },
    transactions: {
      type: DataTypes.JSON,
    },
    hours: {
      type: DataTypes.JSON,
    },
    phone: {
      type: DataTypes.TEXT,
    },
    tags: {
      type: DataTypes.JSONB,
    },
    photo: {
      type: DataTypes.TEXT,
    },
    yelpId: {
      type: DataTypes.TEXT,
    },
  }, {
    sequelize,
    modelName: 'restaurant',
    underscored: true,
    updatedAt: false,
  });

  return Restaurant;
};
