const mockUser = require('../../__mocks__/mockUser');

const login = async (req, res) => {
  // TODO: Auth team do send token with user
  res.send({
    user: mockUser,
    token: '1234',
  });
};

const logout = async (req, res) => {
  // TODO: Auth team do logout
  res.sendStatus(200);
};

module.exports = {
  login,
  logout,
};
