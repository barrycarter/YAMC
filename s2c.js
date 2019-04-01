// functions that the server can call on the client

let s2c = {

 set_tile_fixed: function(arr) {
    [key, val] = arr;
    tile_fixed[key] = val;
  }

  "": function() {
    console.log("null(",arguments,")");
    return "null";
  },


  test: function() {
    console.log("test(",arguments,")");
    return "1";
  },

  test_1:function(a, b, c) {
    console.log("test_1(",arguments,")");
    console.log("B = ",b);
    return 2;
  }
};

// determine which function is being called (and run it)

// note parameter is array, not string

function run_function(arr) {

  // we first check to see if the whole thing is a command
  let args = [];
  let cmd = "";

  // find the biggest part that is a function

  let i = 0;

  for (i= arr.length-1; i >= 0; i--) {

    cmd = arr.slice(0,i).join("_");

    // if this IS a command, break out of loop and run it
    if (s2c[cmd]) {break;}
  }

  // run the function and return whatever it returns
  return s2c[cmd].apply(null, arr.slice(i, arr.length));

  // return [cmd, arr.slice(i, arr.length)];

}

run_function(["test", 2, 3, 4]);
run_function(["test", 1, 3, 4]);

// console.log(run_function("test 1 2 3"));
// run_function("test 2 3 4");
// run_function("nada 1 2 3");

/*
console.log(arr[1]);

let f = arr[0]
console.log(f);
console.log(s2c[f]());
console.log(s2c[arr[0]]());
console.log(s2c[arr[0]]([1,2,3]));
console.log(s2c[arr[0]](arr[1]));
s2c[arr[0]].apply(null, arr[1]);

*/

// console.log(s2c[arr[0]](arr[1]));

// console.log(determine_function("test 1 2 3"));
// xconsole.log(determine_function("tessfdast 1 2 3"));


