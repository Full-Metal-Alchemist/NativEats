const mockCuisines = require('../../__mocks__/mockCuisines');

const createCuisine = async (req, res) => {
  res.sendStatus(200);
};

const getCuisines = async (req, res) => {
  res.send(mockCuisines);
};

const getCuisine = async (req, res) => {
  res.send(mockCuisines[0]);
};

const updateCuisine = async (req, res) => {
  res.send(req.body || mockCuisines[0]);
};

const deleteCuisine = async (req, res) => {
  res.sendStatus(200);
};

module.exports = {
  createCuisine,
  getCuisines,
  getCuisine,
  updateCuisine,
  deleteCuisine,
};
