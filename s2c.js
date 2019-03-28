// functions that the server can call on the client

// determine which function is being called (and run it)

let s2c = {

  "": function() {},

  test: function() {return "test called"},

  test_1:function(a, b, c) {
    console.log(arguments);
    console.log("B = ",b);
    return "";
  }
};

function determine_function(str) {

  // we first check to see if the whole thing is a command
  let arr = str.split(" ");
  let args = [];
  let cmd = "";

  // find the biggest part that is a function

  for (let i= arr.length-1; i >= 0; i--) {

    cmd = arr.slice(0,i).join("_");

    // if this IS a command, return it and args
    if (s2c[cmd]) {
      return [cmd, arr.slice(i, arr.length)];
    }

  }
    
  // should never reach this point, since the empty function is defined
  console.log("Unreachable code point reached");
  return;
}

arr = determine_function("test 1 2 3");

console.log(arr[1]);

let f = arr[0]
console.log(f);
console.log(s2c[f]());
console.log(s2c[arr[0]]());
console.log(s2c[arr[0]]([1,2,3]));
console.log(s2c[arr[0]](arr[1]));

s2c[arr[0]].apply(null, arr[1]);

// console.log(s2c[arr[0]](arr[1]));

// console.log(determine_function("test 1 2 3"));
// xconsole.log(determine_function("tessfdast 1 2 3"));


