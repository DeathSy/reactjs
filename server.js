const path = require('path');
const express = require('express');
const app = express();

const PORT = process.env.PORT || 8080;

app.use(express.static(path.resolve('dist')));

app.get('/', (req, res) => {
  res.sendFile(path.resolve('dist/index.html'));
});

app.listen(PORT, () => {
  console.log('express server is running on port', PORT);
});