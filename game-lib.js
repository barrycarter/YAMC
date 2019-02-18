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
