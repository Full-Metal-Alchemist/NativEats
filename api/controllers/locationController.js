const autocomplete = async (req, res) => {
  const { search } = req.query;
  // TODO: Add location autocomplete service
  // Return latitude/longitude for restaurant search
  res.send([
    {
      name: 'Los Angeles, CA',
      latitude: '34.052235',
      longitude: '-118.243683',
    },
    {
      name: 'Las Vegas, NV',
      latitude: '36.188110',
      longitude: '-115.176468',
    },
  ]);
};

module.exports = {
  autocomplete,
};
