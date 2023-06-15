const Sequelize = require('sequelize');

const db = new Sequelize('nativeats', 'postgres', 'password', {
  host: 'localhost',
  dialect: 'postgres',
});

module.exports = db;
