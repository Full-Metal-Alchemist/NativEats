const mockBookmarks = require('../../__mocks__/mockBookmarks');

const createBookmark = async (req, res) => {
  res.sendStatus(200);
};

const getBookmarks = async (req, res) => {
  res.send(mockBookmarks);
};

const deleteBookmark = async (req, res) => {
  res.sendStatus(200);
};

module.exports = {
  createBookmark,
  getBookmarks,
  deleteBookmark,
};
