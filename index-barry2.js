var WebSocketServer = require('ws').Server;
var http = require('http');
var fs = require('fs');
var port = 5000;
var sqlite3 = require('sqlite3').verbose();

var server = http.createServer();
server.listen(port);
var wss = new WebSocketServer({ server: server });

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

// everything above this line is just to force JS into an infinite
// loop, I don't actually use it right now

// attempt to make the whole code one big async function

var db = new sqlite3.Database('/sites/DB/yamc.db');
// TODO: put actual file name here
var fd = fs.openSync('game-lib.js', 'r');
var buf = Buffer.alloc(1);

async function the_whole_thing() {
  var res = await queryDB("SELECT * FROM users");
  var byte = await readByte(115);
  console.log(res, byte);
}

the_whole_thing();

function queryDB(query) {
  return new Promise( (good, bad) => 
   db.all(query, function(err, res) {good(res);}));
}

function readByte(n) {
 return new Promise( (good, bad) => 
  fs.read(fd, buf, 0, 1, n, function(err, bytes, buf) {good(buf);}));
}







