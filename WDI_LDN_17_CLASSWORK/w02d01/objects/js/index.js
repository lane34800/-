// var pers = new Object();

// person.height = 6;
// person.weight = 87;
// person.name = "Steve";
// person.gender = "M";

// person.tellMeAboutYourself = function() {
//   console.log('height: ' + person.height);
//   console.log('weight: ' + person.weight);
//   console.log('name: ' + person.name);
//   console.log('gender: ' + person.gender);
// };


// var car = new Object();

// car.color = "Green";
// car.make = "Ford";
// car.engineSize = 1600;
// car.wheels = [];
// car.isAutomatic = false;
// car.areWindowsOpen = false;

// car.drive = function() {
//   console.log('Driving');
// };

// car.openWindows = function() {
//   this.areWindowsOpen = true;
// };

// person.tellMeAboutYourself();


var Person = {

  "name" : null,
  "height" : null,
  "sayName" : function() {
    console.log("My name is " + this.name);
  } 
};

var person1 = Object.create(Person);
person1.name = "test";
person1.sayName();