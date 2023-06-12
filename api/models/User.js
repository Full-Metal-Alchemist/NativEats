const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../db/dbInstance');
const Bookmark = require('./Bookmark');

class User extends Model {}

User.init({
  firstName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  lastName: {
    type: DataTypes.STRING,
  },
  username: {
    type: DataTypes.STRING,
  },
  email: {
    type: DataTypes.STRING,
  },
  profilePhoto: {
    type: DataTypes.STRING,
  },
  passwordHash: {
    type: DataTypes.STRING,
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

User.hasMany(Bookmark);

module.exports = User;
