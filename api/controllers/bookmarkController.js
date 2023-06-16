const { Bookmark } = require('../models');
const mockBookmarks = require('../../__mocks__/mockBookmarks');

const createBookmark = async (req, res) => {
  // TODO: Fix when JWT implemented
  // const userId = '1';
  const {
    userId = 1, restaurantId,
  } = req.body;
  await Bookmark.create({
    userId,
    restaurantId,
  });
  res.sendStatus(200);
};

const getBookmarks = async (req, res) => {
  // TODO: Fix when JWT implemented
  const { userId = 1 } = req.query;
  const bookmarks = await Bookmark.findAll({
    where: {
      userId,
    },
    order: [
      ['created_at', 'DESC'],
    ],
    include: ['restaurant'],
  });
  if (bookmarks.length) {
    const bookmarksArray = bookmarks.map((bookmark) => bookmark.restaurant);
    res.send(bookmarksArray);
  } else {
    res.send(mockBookmarks);
  }
};

const deleteBookmark = async (req, res) => {
  // TODO: Fix when JWT implemented
  // const userId = '1';
  const {
    userId = 1, restaurantId,
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
