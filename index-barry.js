var WebSocketServer = require('ws').Server;
var http = require('http');
var fs = require('fs');
var port = 5000;

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

console.log("Starting file read test");

//create a one character buffer and set fd equal to file descriptor

var buf = Buffer.alloc(1);

// TODO: this should be our huge file
var fd = fs.openSync('game-lib.js', 'r');

console.log(fd);

// get the nth byte from a given file descriptor
function byteFromFD(byte, fd) {
  fs.readSync(fd, buf, 0, 1, byte);
  return buf[0];
}

for (var i=0; i < 500; i++) {
  console.log(byteFromFD(i, fd));
 }

// fs.readFile("game-lib.js", 'utf8', function(err, contents) {console.log(contents);});

// define fd to be the file descriptor for our main file

// var fd;



// for (;;) {if (fd) {console.log(fd);}}


/*
buffer = new Buffer.alloc(10000);



fs.open('game-lib.js', 'r', function(status, fd) {
    fs.read(fd, buffer, 0, 17, 22, function(err, bytesRead, buffer) {
	console.log(buffer.toString());
      })
      });

console.log("Test ends");

function nada() {}
*/
