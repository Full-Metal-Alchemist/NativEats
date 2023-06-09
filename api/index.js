require('dotenv').config();

const express = require('express');

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server available at http://localhost:${PORT}`);
});
