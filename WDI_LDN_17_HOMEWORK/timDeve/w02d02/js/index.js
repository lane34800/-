document.addEventListener("DOMContentLoaded", function(){

  var boardMaker = function() {

    this.content = ["e", "e", "e", "e", "e", "e", "e", "e", "e"];
    //tried to use a default content but when I tried to do board.content = board.defaultContent it would link the the two together
    // this.defaultContent = ["e", "e", "e", "e", "e", "e", "e", "e", "e"];
    this.block = true;
    this.whoseTurn = "x";
    this.animation;


    this.winKeeper = function() {
      possibleWin = {
        "h1":[this.content[0], this.content[1], this.content[2]],
        "h2":[this.content[3], this.content[4], this.content[5]],
        "h3":[this.content[6], this.content[7], this.content[8]],
        "v1":[this.content[0], this.content[3], this.content[6]],
        "v2":[this.content[1], this.content[4], this.content[7]],
        "v3":[this.content[2], this.content[5], this.content[8]],
        "d1":[this.content[0], this.content[4], this.content[8]],
        "d2":[this.content[2], this.content[4], this.content[6]]
      };
    };

    this.build = function() {
      var arraySquareElement = document.getElementsByClassName("square");

      for (i = 0; i < arraySquareElement.length; i++) {

        var squareNumber = i + 1; 
        var id ="square" + squareNumber;
        var el = document.getElementById(id);

        el.addEventListener("click", function(){
          var whichCase = (parseInt(this.id.substr(this.id.length - 1)) - 1);
          if (board.whoseTurn === "x") {
            playerX.pickCase(whichCase);

            if (game.AIswitch) {
              playerAI.pickCaseAI();
            }
          }

          else if (board.whoseTurn === "o") {
            playerO.pickCase(whichCase);
          }

        });
      };
    };


    this.isThereaWin = function() {
      board.winKeeper();
      for (var prop in possibleWin) {
        if (!possibleWin.hasOwnProperty(prop)) {
                continue;
            }
        var winCheck = possibleWin[prop];

        if ((winCheck[0] !== "e") && (winCheck[0] === winCheck[1]) && (winCheck[0] === winCheck[2])) {
          return [winCheck[0], true];
        }
      }
    };


    this.isThereaDraw = function() {
      board.winKeeper();
      var availableWin = 8;
      for (var prop in possibleWin) {
        if (!possibleWin.hasOwnProperty(prop)) {
                continue;
            }
        var winCheck = possibleWin[prop];

        if ( ((winCheck[0] !== "e") && (winCheck[1] !== "e")) && (winCheck[0] !== winCheck[1]) ) {
          availableWin--;
        }
        else if ( ((winCheck[1] !== "e") && (winCheck[2] !== "e")) && (winCheck[1] !== winCheck[2]) ) {
          availableWin--;
        }
        else if ( ((winCheck[0] !== "e") && (winCheck[2] !== "e")) && (winCheck[0] !== winCheck[2]) ) {
          availableWin--;
        }
      }
      if (availableWin === 0) {
        return true;
      }
    };


    this.reset = function() {
      board.whoseTurn = "x";
      //Tried to do board.content = board.defaultContent but it produced a bug
      board.content = ["e", "e", "e", "e", "e", "e", "e", "e", "e"];
      board.refresh();
    };


    this.refresh = function() {
      for (var i = 0; i < board.content.length; i++) {
        var squareNumber = i + 1;
        var id ="square" + squareNumber;
        var el = document.getElementById(id);

        el.value = " ";
        el.classList.remove("redXState");
        el.classList.remove("blueOState");

        if ( board.content[i] === "x") {
          el.value = "X";
          el.classList.add("redXState");

        }
        else if ( board.content[i] === "o") {
          el.value = "O";
          el.classList.add("blueOState");
        }
      }
    };


    this.winAnimation = function(winner) {
      board.reset();
      var counter = 0;
      board.content.unshift(winner);
      board.content.pop();
      board.refresh();
      board.animation = setInterval(function() {
        if (counter < 9) {
          board.content.unshift("e");
          board.content.pop();
          board.refresh();
          counter++;
        }
        else {
          board.content.unshift(winner);
          board.content.pop();
          board.refresh();
          counter = 0;
        }
      } , 300);
    };


  };




  var gameMaker = function() {
    this.scoreCounterX = 0;
    this.scoreCounterO = 0;
    this.haveAI = false;


    this.refreshScore = function() {
      document.getElementById("scoreO").innerHTML = "Score O: " + game.scoreCounterO;
      document.getElementById("scoreX").innerHTML = "Score X: " + game.scoreCounterX;
      if ((game.scoreCounterO === 3) || (game.scoreCounterX === 3)) {
        if (game.scoreCounterX === 3) {
          winnerIs = "x";
        }
        else if (game.scoreCounterO === 3) {
          winnerIs = "o";
        }
      }
    };

    this.refreshStatus = function(status) {
      var el = document.getElementById("status");
      var playerTurn;

      el.innerHTML = "";

      if (board.whoseTurn === "x") {
        playerTurn = "it's player X turn.";
      }
      else if (board.whoseTurn === "o") {
        playerTurn = "it's player O turn.";
      }

      el.innerHTML = playerTurn;
      
      if (status === "draw") {
        el.innerHTML = "Draw.<br>" + playerTurn;
      }
      else if (status === "XWinsTurn") {
        el.innerHTML = "X wins the last round.<br>" + playerTurn;
      }
      else if (status === "OWinsTurn") {
        el.innerHTML = "O wins the last round.<br>" + playerTurn;
      }
      else if (status === "XWinsGame") {
        el.innerHTML = "X wins the game.<br>";
      }
      else if (status === "OWinsGame") {
        el.innerHTML = "O wins the game.<br>";
      }
    };


    this.build= function() {
      function baseReset() {
        board.block = false;
        game.scoreCounterX = 0;
        game.scoreCounterO = 0;
        board.whoseTurn = "x";
        clearInterval(board.animation);
        game.refreshStatus();
        game.refreshScore();
        board.reset();
      }

      document.getElementById("reset").addEventListener("click", function() {
        baseReset();
      });


      document.getElementById("p1vp2").addEventListener("click", function() {
        document.getElementById("p1vp2").style.backgroundColor='#55779a';
        document.getElementById("p1vcpu").style.backgroundColor='';
        baseReset();
        game.hasAI = false;
      });

      document.getElementById("p1vcpu").addEventListener("click", function() {
        document.getElementById("p1vcpu").style.backgroundColor='#55779a';
        document.getElementById("p1vp2").style.backgroundColor='';
        baseReset();
        game.hasAI = true;
      });
    };

  };




  var player = function(side) {

    if (side === "ai") {
      this.pickCase = function() {
        var emptyValue = false;
        for (i=0; i < board.content.length; i++) {
          if (board.content[i] === "e") {
            while(!emptyValue) {
              var arrayLength = board.content.length - 1;
              var random = Math.floor(Math.random() * (arrayLength + 1));
              if (board.content[random] === "e") {
                board.content[random] = "o";
                return;
              }
            }
          }
        }
      };
    }

    else {
      this.pickCase = function(thisCase){
        if (board.block !== true) {

          if (board.content[thisCase] === "e") {

            if (side === "x") {
              board.content[thisCase] = "x";
              if (game.hasAI) {
                playerAI.pickCase();
              }
              else {
                board.whoseTurn = "o";
              }
              game.refreshStatus();
            }

            else if (side === "o") {
              board.content[thisCase] = "o";
              board.whoseTurn = "x";
              game.refreshStatus();
            }

            board.refresh();

            if(typeof board.isThereaWin() !== 'undefined') {

              if (board.isThereaWin()[0] === "x") {
                game.scoreCounterX++;
                board.reset();
                game.refreshScore();
                if (game.scoreCounterX === 3) {
                  game.refreshStatus("XWinsGame");
                  board.winAnimation("x");
                  board.block = true;
                }
                else {
                  game.refreshStatus("XWinsTurn");
                }
              }

              else {
                game.scoreCounterO++;
                board.reset();
                game.refreshScore();
                if (game.scoreCounterO === 3) {
                  game.refreshStatus("OWinsGame");
                  board.winAnimation("o");
                  board.block = true;
                }
                else {
                  game.refreshStatus("OWinsTurn");
                }
              }

            }

            if (board.isThereaDraw()) {
              board.resetd();
              game.refreshStatus("draw");
            }
          }
        }
      };
    }
  };



  
  var game = new gameMaker();
  var board = new boardMaker();
  var playerX = new player("x");
  var playerO = new player("o");
  var playerAI = new player("ai");


  board.build();
  game.build();


});