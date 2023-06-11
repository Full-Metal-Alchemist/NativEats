const mockUser = require('../../__mocks__/mockUser');

const createUser = async (req, res) => {
  res.sendStatus(200);
};

const getUser = async (req, res) => {
  res.send(mockUser);
};

const updateUser = async (req, res) => {
  res.send(req.body || mockUser);
};

const deleteUser = async (req, res) => {
  res.sendStatus(200);
};

module.exports = {
  createUser,
  getUser,
  updateUser,
  deleteUser,
};
