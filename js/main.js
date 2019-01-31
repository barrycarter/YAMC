const command = document.getElementById("command");
const histCmd = document.getElementById("histCmd");
const userame = document.getElementById("username");




console.log("username is",username, "command is",command);

// Initial position of the robot
// this start position is ~ Gibralatar
// (http://test.barrycarter.info/bc-gettileyamc.php)
let positionX = 20934, positionY = 6467;

// show the text in history log
// function display(element) {
//   histCmd.appendChild(document.createTextNode(element));
//   histCmd.appendChild(document.createElement("br"));
// }

function display(element) {
  histCmd.insertBefore(document.createTextNode(element), histCmd.childNodes[0]);
  histCmd.insertBefore(document.createElement("br"), histCmd.childNodes[0]);
}









// send command to server and write response to console (for now)
function send_command(command) {
 fetch("http://test.barrycarter.info/game-engine.pl?cmd="+command+"&username="+username.value)
.then((response) => response.text())
.then((body) => display(body))
.catch(console.error)
}

const btnConfirm = document.getElementById("btnConfirm").addEventListener("click", function (event) {
  event.preventDefault();
  send_command(command.value);
  // display("Your command: "+command.value);
  // console.log(command.value)
  command.value = "";
  
});