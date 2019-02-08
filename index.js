const express = require('express'); // import the express package

const server = express(); // creates the server

const port = process.env.PORT || 8080;

// handle requests to the root of the api, the / route
server.get('/', (req, res) => {
	res.send('API running!');
});

// watch for connections on port 8080
server.listen(port, () =>
	console.log('Server running on http://localhost:8080')
);
