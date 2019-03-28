// functions that the server can call on the client

// determine which function is being called (and run it)

let s2c = {

  "": function() {},

  test: function() {},

  test_1:function() {},
};

console.log(s2c.test);
console.log(s2c['test']);

function determine_function(str) {

  // we first check to see if the whole thing is a command
  let arr = str.split(" ");
  let args = [];
  let cmd = "";

  // find the biggest part that is a function

  for (let i= arr.length-1; i >= 0; i--) {

    cmd = arr.slice(0,i).join("_");

    console.log("CMD",cmd,"/CMD");
    console.log("S2C.cmd",s2c.cmd,"/S2C");


    // if this IS a command, return it and args
    if (s2c[cmd]) {
      return [cmd, arr.slice(i, arr.length)];
    }

  }
    
  // should never reach this point, since the empty function is defined
  console.log("Unreachable code point reached");
  return;
}

console.log(determine_function("test 1 2 3"));


