const Sequelize = require('sequelize');

const db = new Sequelize('nativeats', 'postgres', 'password', {
  host: '127.0.0.1',
  dialect: 'postgres',
});

module.exports = db;
