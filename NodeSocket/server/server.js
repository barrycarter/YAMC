const express = require('express');
const app = express();
const server = require('http').Server(app); // handle HTTP requests
const PORT = 8000;

// middleware to render static files
app.use(express.static(__dirname + '/client'));

app.get('/', (req, res) => {
	res.sendFile(__dirname + '/index.html');
});

server.listen(PORT, () => {
	console.log(`Sever running on port ${PORT}`);
});
