$(function(){

// Setup initial state variables
  var $numbers   = $(".number");
  var $operators = $(".operator");
  var $display   = $(".display");
  var $eq        = $(".eq");
  var $clear     = $(".clear");

//set up calculation varibles
  var first_number  = "";
  var second_number = "";
  var operator      = "";
  var answer;

// Setup eventListeners
  $numbers.on("click", updateDisplay);
  $operators.on("click", setOperator);
  $eq.on("click", function(){
    calculate(first_number, second_number, operator)
  });
  $clear.on("click", clearForm);


//calculate function
  function calculate(first_number, second_number, operator) {
    switch (operator) {
      case "+":
      $display.val(first_number + second_number);
      break;
      case "-":
      $display.val(first_number - second_number);
      break;
      case "/":
      $display.val(first_number / second_number)
      break;
      case "x":
      $display.val(first_number * second_number);
      break;
    }
  }

//clearForm function
  function clearForm() {
    first_number = second_number = operator = "";
    $display.val("");
  }

//updateDisplay function
  function updateDisplay() {
    var btn = $(this).val();
    $display.val($(this).val());
    
    if(typeof first_number !== 'number') {
      first_number = parseFloat(btn);
    } else {
      second_number = parseFloat(btn);
    }
  }

//setOperator function 
  function setOperator() {
    operator = $(this).val();
  }
})

