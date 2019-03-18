// var foo = require('game-lib.js');

var obj = {};

// Object.defineProperty(obj, "x", 42);
Object.defineProperty(obj, 'x', {value: {'y': 42}});

console.log(obj.x.y);

/*

var a = {num: 17};

var h = {};
h.set = function(obj, prop) {console.log("GOT",obj); obj.num = 42;}

var b = new Proxy(a, h);

a = {num: 22};

console.log(a);
*/

// console.log(foo.land);

var data = {};
data.a = [17]; 
   
Object.defineProperty(data, "a",{
  get: function() { console.log('accessed a'); return this._a; },
      set: function(value) { this._a = value; console.log('modified a'); }
  }); 

console.log(data.a);

data.a = [18]; 
console.log(data.a)

console.log(data.a.get);

Object.defineProperty(data, "a",{"num" : 42});

console.log(data.a);
