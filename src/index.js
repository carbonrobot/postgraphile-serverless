const serverless = require('serverless-http');
const express = require('express');

const app = express();

app.use(/* register your middleware as normal */);

app.get('/', function (req, res) {
  res.send('Hello World!')
});

module.exports.handler = serverless(app);
