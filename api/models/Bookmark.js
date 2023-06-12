const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../db/dbInstance');

class Bookmark extends Model {}

Bookmark.init({}, {
  sequelize,
  modelName: 'bookmark',
  underscored: true,
  updatedAt: false,
  createdAt: false,
});

module.exports = Bookmark;
