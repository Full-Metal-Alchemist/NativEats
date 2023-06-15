const axios = require('axios');

const getRestaurant = async (req, res) => {
  const { yelpId } = req.params;
  console.log('yelpId', yelpId);
  const endpoint = `https://api.yelp.com/v3/businesses/${yelpId}`;
  const option = {
    method: 'GET',
    url: endpoint,
    headers: {
      Authorization: `Bearer ${process.env.TOKEN}`,
    },
  };

  axios(option)
    .then((result) => {
      res.send(result.data);
    })
    .catch((err) => { console.log(err); });
};
module.exports = {
  getRestaurant,
};
