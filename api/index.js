require('dotenv').config();
const express = require('express');
const compression = require('compression');
const cors = require('cors');
const helmet = require('helmet');
const xss = require('xss-clean');
const apiV1Routes = require('./routes/api/v1');

const PORT = process.env.PORT || 8080;

const app = express();

app.use(helmet());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(xss());
app.use(compression());
app.use(cors());
app.options('*', cors());

app.use('/api/v1', apiV1Routes);

app.listen(PORT, () => {
  console.log(`Server available at http://localhost:${PORT}`);
});
