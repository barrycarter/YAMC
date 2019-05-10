const express = require('express');

const app = express();
const port  = process.env.PORT || 3000;

//Web sockets routes
const routes = require('./routes')

const server = app.listen(port, () => {
    console.log('Server is up on port ',port);
});

