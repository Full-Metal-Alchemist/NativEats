const mockUser = require('../../__mocks__/mockUser');
const { User } = require('../models');

const getPuid = async (req, res) => {
  const { email } = req.user;
  try {
    const user = await User.findOne({ where: { email } });
    console.log('getPuid User***', user);
    res.status(200).json(user.id);
  } catch (err) {
    console.log('Error getting puid', err);
    res.sendStatus(500);
  }
};

const createUser = async (req, res) => {
  const userData = {
    firstName: req.user.displayName ? req.user.displayName.split(' ')[0] : 'anon',
    lastName: req.user.displayName ? req.user.displayName.split(' ')[1] : null,
    email: req.user.email,
    profilePhoto: req.user.profilePhoto || null,
  };
  try {
    const user = await User.create(userData);
    res.status(201).json(user.id);
  } catch (err) {
    console.log('Error creating new user', err);
    res.sendStatus(500);
  }
};

const getUser = async (req, res) => {
  const { userId } = req.params;
  const user = await User.findByPk(userId, { include: ['bookmarks'] });

  const userData = user.get();

  const bookmarks = userData.bookmarks.map(({ restaurantId }) => restaurantId);

  if (userData) {
    res.send({
      ...userData,
      bookmarks,
    });
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
  getPuid,
  createUser,
  getUser,
  updateUser,
  deleteUser,
};
