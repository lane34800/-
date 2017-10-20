while (true) {
  var firstNumber = Number(prompt("Enter first number."));
  var operation = prompt("What operation do you want to do? Options are '+', '-', '/', '*', 'power' and 'square root'.");

  if (operation === "square root") {
    result = Math.sqrt(firstNumber);
    window.alert("The result of the square root of " + firstNumber + " is " + result);
  }

  else {
    var secondNumber = Number(prompt("Enter the second number."));

    switch (operation) {
      case "+":
          result = firstNumber + secondNumber;
          break;
      case "-":
          result = firstNumber - secondNumber;
          break;
      case "/":
          result = firstNumber / secondNumber;
          break;
      case "*":
          result = firstNumber * secondNumber;
          break;
      case "power":
          result = Math.pow(firstNumber, secondNumber);
          break;
    }
    window.alert("The result of " + firstNumber + " " + operation + " " + secondNumber + " is " + result);
  }

}