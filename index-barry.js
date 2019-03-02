var WebSocketServer = require('ws').Server;
var http = require('http');
var fs = require('fs');
var util = require('util');
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

var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('/sites/DB/yamc.db');

// perform a query our sqlite3 db and return results

function queryDB(query) {
  db.all(query, function(err, res) {arr = res;});
  return arr;
}

function queryDB2(query) {
  return new Promise( (resolve, reject) =>
   db.all(query, function(err, data) {
    if (err) {return reject(err);} else {return resolve(data);}}));
}

const betterdball = util.promisify(db.all);

console.log(betterdball("SELECT * FROM users"));


function queryDB3(query) {
  return new Promise( (resolve, reject) =>
   db.all(query, function(err, data) {
    if (err) {return reject(err);} else {return resolve(data);}}));
}

async function wrapper(query) {
//     console.log(await queryDB2(query));
     var ret = await queryDB2(query);
     return ret;
}

function queryDB4(db, query) {
  return new Promise( (resolve, reject) =>
   db.all(query, function(err, data) {
    if (err) {return reject(err);} else {return resolve(data);}}));
}

function queryDB5(db, query) {
   db.all(query, function(err, data) {
    if (err) {return err;} else {return data;}
});
}

function queryDB6(db, query, callback) {db.all(query, callback);}

easyQuery = util.promisify(queryDB6);

console.log(easyQuery(db, "SELECT * FROM users"));

// queryDB2("SELECT * FROM users").then( result => console.log(result));

// console.log(wrapper("SELECT * FROM users"));

// queryDB2("SELECT * FROM users").then( result => {x=result;});

// console.log(res);
    

// db.each("SELECT * FROM users", function(err, row) {
//     console.log(row.username, row.variable, row.value);
//   });


// get the nth byte from a given file descriptor
function byteFromFD(byte, fd) {
  fs.readSync(fd, buf, 0, 1, byte);
  return buf[0];
}

// for (var i=0; i < 500; i++) {
//  console.log(byteFromFD(i, fd));
// }

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
