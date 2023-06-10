const getUser = async (id) => {
  const userData = {
    profile_photo: 'model-1.jpg',
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(50),
    email VARCHAR(50),
    password_hash TEXT,
    latitude TEXT,
    longitue TEXT}
};

module.exports = {
  getUser,
};
