// index for fastcomet hosting testing

var WebSocketServer = require('ws').Server;
var http = require('http');
var express = require('express');
var fs = require('fs');
var jimp = require('jimp');

var app = express();
var port = process.env.PORT || 5000;

// mongo db testing
// no actual testing here, just forcing npm install to recognize mongodb
var mongodb = require('mongodb');
// var MongoClient = mongodb.MongoClient;
// var url = process.env.MONGODB_URI;

// other libs loaded solely to force "npm install" to grab them
var png = require('pngjs');

// MongoClient.connect(url, function (err, db) {
//    if (err) {
//      console.log('Unable to connect to the mongoDB server. Error:', err);
//    } else {
//      console.log('Connection established to', url);

      // do some work here with the database.

      //Close connection
//      db.close();
//    }
//  });

app.use(express.static(__dirname + '/'));

var server = http.createServer(app);
server.listen(port);

console.log('http server listening on %d', port);

var wss = new WebSocketServer({ server: server });
console.log('websocket server created');

wss.on('connection', function(ws) {
	var id = setInterval(function() {
		ws.send(JSON.stringify(new Date()), function() {});
	}, 1000);

	ws.on('message', str => {
		ws.send('hey');
	});

	console.log('websocket connection open');

	ws.on('close', function() {
		console.log('websocket connection close');
		clearInterval(id);
	});
});