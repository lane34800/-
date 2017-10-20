var screenContent="";

// Append the the character and refresh the screen;
function appendAndRefresh(arg) {
  screenContent = screenContent+arg;
  document.getElementById('display').innerHTML = screenContent;
}
// Deletes Last Character
function deleteLastChar() {
  screenContent = screenContent.substr(0, screenContent.length-1);
}

// Checks if the last characteris an operator
function checkIfLastOperator() {
  var lastChar = screenContent.substr(screenContent.length - 1);
  var operator = ["+", "-", "*", "/", "."];
  for (i = 0; i < operator.length; i++) {
    if (operator[i] === lastChar) {
      return true;
    }
  }
  return false;
}

// Because you realise at the last moment that you might want to multiply or divide by a negative number
function checkIfLastOperatorforMinus() {
  var lastChar = screenContent.substr(screenContent.length - 1);
  var operator = ["+", "-"];
  for (i = 0; i < operator.length; i++) {
    if (operator[i] === lastChar) {
      return true;
    }
  }
  return false;
}

// Event listener for the buttons
document.getElementById('1').addEventListener("click", function(event){
  appendAndRefresh('1');
});

document.getElementById('2').addEventListener("click", function(event){
  appendAndRefresh('2');
});

document.getElementById('3').addEventListener("click", function(event){
  appendAndRefresh('3');
});

document.getElementById('4').addEventListener("click", function(event){
  appendAndRefresh('4');
});

document.getElementById('5').addEventListener("click", function(event){
  appendAndRefresh('5');
});

document.getElementById('6').addEventListener("click", function(event){
  appendAndRefresh('6');
});

document.getElementById('7').addEventListener("click", function(event){
  appendAndRefresh('7');
});

document.getElementById('8').addEventListener("click", function(event){
  appendAndRefresh('8');
});

document.getElementById('9').addEventListener("click", function(event){
  appendAndRefresh('9');
});

document.getElementById('0').addEventListener("click", function(event){
  appendAndRefresh('0');
});

document.getElementById('dot').addEventListener("click", function(event){
  if (!checkIfLastOperator()) {
    appendAndRefresh('.');
  }
});

document.getElementById('plus').addEventListener("click", function(event){
  if (checkIfLastOperator()) {
    deleteLastChar();
    appendAndRefresh('+');
  }
  else {
    appendAndRefresh('+');
  }
});

document.getElementById('minus').addEventListener("click", function(event){
  if (checkIfLastOperatorforMinus()) {
    deleteLastChar();
    appendAndRefresh('-');
  }
  else {
    appendAndRefresh('-');
  }
});

document.getElementById('divide').addEventListener("click", function(event){
  if (checkIfLastOperator()) {
    deleteLastChar();
    appendAndRefresh('/');
  }
  else {
    appendAndRefresh('/');
  }
});

document.getElementById('multi').addEventListener("click", function(event){
  if (checkIfLastOperator()) {
    deleteLastChar();
    appendAndRefresh('*');
  }
  else {
    appendAndRefresh('*');
  }
});

document.getElementById('clear').addEventListener("click", function(event){
  screenContent ="";
  document.getElementById('display').innerHTML = screenContent;
});

document.getElementById('del').addEventListener("click", function(event){
  deleteLastChar();
  document.getElementById('display').innerHTML = screenContent;
});

document.getElementById('equal').addEventListener("click", function(event){
  if (!checkIfLastOperator()) {
    screenContent = eval(screenContent);
    screenContent = Math.round(screenContent * 100) / 100;
    screenContent = screenContent.toString();
    document.getElementById('display').innerHTML = screenContent;
  }
  
});