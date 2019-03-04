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
