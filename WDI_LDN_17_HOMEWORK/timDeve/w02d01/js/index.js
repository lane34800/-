soundManager.setup({
  url: '/path/to/swfs/',
  flashVersion: 9,
  preferFlash: false, // prefer 100% HTML5 mode, where both supported
  onready: function() {
    //nothing in there
  },
  ontimeout: function() {
    // console.log('SM2 init failed!');
  },
  defaultOptions: {
    // set global default volume for all sound objects
    volume: 33
  }
});

document.addEventListener("DOMContentLoaded", function() {

  var keyValue = {
    "e" : 69,
    "r" : 82,
    "t" : 84,
    "y" : 89,
    "u" : 85,
    "i" : 73,
    "d" : 68,
    "f" : 70,
    "g" : 71,
    "h" : 72,
    "j" : 74,
    "k" : 75,
    "c" : 67,
    "v" : 86,
    "b" : 66,
    "n" : 78
  };

  var buttons = {};

  var button = function(id){
    this.fileToPlay = "sounds/" + id + ".wav";
    this.key = keyValue[document.getElementById(id).value];
    this.playFunction = soundManager.createSound({
          "id": id,
          "url": "sounds/" + id + ".wav" // Tried to use this.fileToPlay here but I couldn't get it to work is it because this.refers to the inner funciton?
    });


    this.playSound = function() {
      console.log(this.playFunction);
      this.playFunction.play();
    };

  };

  function highlight(id) {
    document.getElementById(id).classList.add("highlight");
    setTimeout(function() {
      document.getElementById(id).classList.remove("highlight");
    }, 200);
  } 

  var makeMyButtonsObjects = function() {

    var myButtonsArray = document.getElementsByClassName("button");

    for (i = 0; i < myButtonsArray.length; i++) {

      var thisId = myButtonsArray[i].id;
      var buttonObject = new button(thisId);
      buttons[thisId] = buttonObject;
    }

  };

  function makeTheButtonWork() {

    for (var prop in buttons) {
      // console.log(buttons);
      
      document.getElementById(prop).addEventListener("click", function(event) {
        var thisId = this.id;
        highlight(thisId);
        buttons[thisId].playSound();
      });
    }


      document.addEventListener('keydown', function(event) {
        for (var prop in keyValue) {
          if(event.keyCode == keyValue[prop]) {
            for (var property in buttons) {
              console.log(buttons[property]);
              if (buttons[property].key === keyValue[prop]) {
                highlight(property);
                buttons[property].playSound();
              }
            }
          }
        }
        
      });
    
  }

  makeMyButtonsObjects();
  makeTheButtonWork();

});