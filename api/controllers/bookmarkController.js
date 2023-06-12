const Bookmark = require('../models/Bookmark');

const createBookmark = async (req, res) => {
  // TODO: Fix when JWT implemented
  const userId = '1';
  const {
    restaurantId,
  } = req.body;
  await Bookmark.create({
    userId,
    restaurantId,
  });
  res.sendStatus(200);
};

const deleteBookmark = async (req, res) => {
  // TODO: Fix when JWT implemented
  const userId = '1';
  const {
    restaurantId,
  } = req.body;
  await Bookmark.destroy({
    where: { userId, restaurantId },
  });
  res.sendStatus(200);
};

module.exports = {
  createBookmark,
  deleteBookmark,
};
