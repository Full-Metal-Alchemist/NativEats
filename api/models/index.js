const sequelize = require('../db/dbInstance');
const Bookmark = require('./Bookmark')(sequelize);
const Cuisine = require('./Cuisine')(sequelize);
const Recipe = require('./Recipe')(sequelize);
const Restaurant = require('./Restaurant')(sequelize);
const Review = require('./Review')(sequelize);
const User = require('./User')(sequelize);

Bookmark.belongsTo(Restaurant);
// Bookmark.belongsTo(User, { foreignKey: 'user_id' });
Cuisine.belongsToMany(Restaurant, { through: 'cuisine_restaurant', as: 'restaurants'});
Cuisine.belongsToMany(Recipe, { through: 'cuisine_recipe', as: 'recipes' });
Recipe.belongsToMany(Cuisine, { through: 'cuisine_recipe', as: 'cuisines' });
Restaurant.belongsToMany(Cuisine, { through: 'cuisine_restaurant', as: 'cuisines' });

Restaurant.hasMany(Review, { as: 'reviews' });
Review.belongsTo(Restaurant);
Review.belongsTo(User);
User.hasMany(Review, { as: 'reviews' });
User.hasMany(Bookmark, { as: 'bookmarks' });

module.exports = {
  Bookmark,
  Cuisine,
  Recipe,
  Restaurant,
  Review,
  User,
};
