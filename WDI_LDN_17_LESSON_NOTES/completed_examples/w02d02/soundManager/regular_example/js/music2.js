console.log('Hello Niall...')

soundManager.setup({                                                                                    //configure soundManager
  url: '/swf',
  onready: function() {
      setUpSoundBoard()                                                                                 //onReady, call setUpSoundBoard() function
  }
});


function setUpSoundBoard() {

  var buttons = document.querySelectorAll("#player a");                                                 //get all buttons
  for (var i = 0; i < buttons.length; i++) {                                                            //itterate through buttons

    buttons[i].addEventListener("click", function(event){                                               //add event listeners to buttons
      var filename = event.currentTarget.firstElementChild.getAttribute('id') + ".wav";
                       //get sound file path 
      var sound = soundManager.createSound({                                                            //create sound object
        id: 'sound_'+filename, 
        url: '/sounds/'+filename
      }).play();                                                                                         //play sound
                                                                                         
    });

  }

 } 