// Question 1
function maxOfTwoNumbers(number1, number2) {
  if (number1 > number2) {
    return number1;
  }
  else if (number1 < number2) {
    return number2;
  }
  else if (number1 === number2) {
    return "They are equal numbers";
  }
}

// Question 2
function maxOfThree(number1, number2, number3) {
  if (number1 > number2) {
    if (number1 > number3) {
      return number1;
    }
  }
  if (number2 > number1) {
    if (number2 > number3) {
      return number2;
    }
  }
  if (number3 > number2) {
    if (number3 > number1) {
      return number3;
    }
  }
}

// Question 3
function isCharacterAVowel(arg) {
  var vowel = ['a', 'e', 'i', 'o', 'u'];
  for (i = 0; i <= vowel.length; i++) {
    if (arg == vowel[i]) {
      return true;  
    }
  } 
  return false;
}
//['1', '2', '3']
// Question 4
function sumArray(arg) {
  var sum1;
  for (i = 0; i <= arg.length; i++) {
    sum1 = 0 + arg[i];
  }
  return sum1;
}


// Question 4
function multiplyArray() {

}


// Question 5
var numberOfArguments = function(){
  return arguments.length;
}



// Question 6
var reverseString = function (){
  
};


// Question 7
function findLongestWord () {
  
}


// Question 8
function filterLongWords () {
  
}


// Bonus 1
//??????


// Bonus 2
function charactersOccurencesCount() {
  
}