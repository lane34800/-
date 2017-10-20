alert("Welcome to the calculator!")

var running = true;

while (running) {

  var first    = false,
      second   = false,
      operator = false;

  first  =  parseInt(prompt("What is your first number?"));
  operator = prompt("What do you want to do? (p)lus / (s)ubtract / (d)ivide / (m)ultiply");
  second =  parseInt(prompt("What is your second number?"));
    
  if (first != false && second != false && operator != null) {

    switch(operator){
      case "p":
        answer = first + second;
        break;
      case "s":
        answer = first - second
        break;
      case "d":
        answer = first / second
        break;
      case "m":
        answer = first * second
        break;
    }
    alert("The answer is "+ answer);
    first    = false
    second   = false
    operator = false
    answer   = undefined;

    var input = prompt("Do you want to continue (y)es/(n)o").toLowerCase();
    if (input === "y") {
      running = false;
    }
    
  } else {
    var input = prompt("Do you want to continue (y)es/(n)o").toLowerCase();
    if (input === "n") {
      running = false;
    }
  }
}

alert("Thank you for using the calculator!")
