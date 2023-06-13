const { Bookmark } = require('../models');
const mockBookmarks = require('../../__mocks__/mockBookmarks');

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

const getBookmarks = async (req, res) => {
  // TODO: Fix when JWT implemented
  const userId = '1';

  const bookmarks = await Bookmark.findAll({
    where: {
      userId,
    },
  });

  if (bookmarks.length) {
    const bookmarkArray = bookmarks.map((bookmark) => bookmark.restaurantId);
    res.send(bookmarkArray);
  } else {
    res.send(mockBookmarks);
  }
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
  getBookmarks,
  deleteBookmark,
};
