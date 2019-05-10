// The purpose of this function is to convert x and y pixels to latitude and longitude
// What is ret ? Let's use a naming more simple. @Barry
function XY2LatLon(obj) {
  let ret = {};
  ret.lon = (2*obj.x-43199)/240;
  ret.lat = (21599-2*obj.y)/240;
  return ret;
}

function LatLon2XY(obj) {
  return {x: Math.round((43199+240*obj.lon)/2), y: Math.round((21599-240*obj.lat)/2)}
}

function send_msg(msg) {
  console.log("SENDING: ",msg);
  if (socket.readyState == 1) {
    socket.send(msg);
    return;
  }
  setTimeout(function() {send_msg(msg)}, 1000);
}

// {tag: "user", data: {"username": "foo", "x": 123, "y": 456}}

function recv_msg (msg) {
  var obj = JSON.parse(msg);

  if (obj.tag == "user") {update_user(obj); return;}
  
  if (obj.tag == "users") {obj.data.map(user => update_user(user)); return;}
} 

function update_user(obj) {userinfo[obj.data.username] = obj.data;}

function arr2str (arr, jc=",") {return arr.join(jc);}

function dump(obj) {
  var out = '';
  for (var i in obj) {
    out += i + ": " + obj[i] + "\n";
  }
  return out;
}

function toHex(d) {
  s = d.toString(16);
  if (s.length < 2) {s = "0"+s;}
  return s;
}

// various land types

// TODO: this must be copied to game-lib.pl since I am canonicalizing it here

var land = [];

land[0] = {'type': 'water', 'color': [0,0,255], 
	   'movecost': Number.POSITIVE_INFINITY, 
	   'resources': {'water': 3, 'food': 1}};

land[1] = {'type': 'snow/ice', 'color': [255,255,255], 
	   'movecost': 4, 
	   'resources': {'water': 2}};

land[2] = {'type': 'barren', 'color': [128,128,128], 
	   'movecost': 5,
	   'resources': {'sand': 3}};

land[3] = {'type': 'grassland', 'color': [255,255,0], 
	   'movecost': 1, 
	   'resources': {'food': 1, 'mud': 1}};

land[4] = {'type': 'forest', 'color': [0,255,0], 
	   'movecost': 2, 
	   'resources': {'food': 2, 'mud': 2}};

land[5] = {'type': 'wetland', 'color': [0,255,255],
	   'movecost': 3, 
	   'resources': {'water': 2}};

land[6] = {'type': 'cropland', 'color': [128,128,0], 
	   'movecost': 0.5, 
	   'resources': {'food': 3}};

land[7] = {'type': 'urban', 'color': [255,0,0], 
	   'movecost': 0.25, 
	   'resources': {'person': 1}};
