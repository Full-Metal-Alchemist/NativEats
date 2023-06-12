const mockUser = require('../../__mocks__/mockUser');
const User = require('../models/User');

const createUser = async (req, res) => {
  const {
    email,
    firstName,
    lastName,
    passwordHash,
  } = req.body;
  const user = await User.create({
    email,
    firstName,
    lastName,
    passwordHash,
  });
  res.send(user);
};

const getUser = async (req, res) => {
  const { userId } = req.params;
  const user = await User.findByPk(userId);

  if (user) {
    res.send(user);
  } else {
    // TODO: Fix as 404 when login is done
    res.send(mockUser);
  }
};

const updateUser = async (req, res) => {
  const { userId } = req.params;
  await User.update(req.body, {
    where: { id: userId },
  });
  res.send(req.body || {});
};

const deleteUser = async (req, res) => {
  const { userId } = req.params;
  await User.destroy({
    where: { id: userId },
  });
  res.sendStatus(200);
};

module.exports = {
  createUser,
  getUser,
  updateUser,
  deleteUser,
};
