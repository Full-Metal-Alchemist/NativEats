const { DataTypes, Model } = require('sequelize');

module.exports = (sequelize) => {
  class User extends Model {}

  User.init({
    firstName: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    lastName: {
      type: DataTypes.TEXT,
    },
    username: {
      type: DataTypes.TEXT,
    },
    email: {
      type: DataTypes.TEXT,
    },
    profilePhoto: {
      type: DataTypes.TEXT,
    },
    passwordHash: {
      type: DataTypes.TEXT,
    },
    latitude: {
      type: DataTypes.GEOMETRY,
    },
    longitude: {
      type: DataTypes.GEOMETRY,
    },
  }, {
    sequelize,
    modelName: 'user',
    underscored: true,
    updatedAt: false,
  });

  return User;
};
