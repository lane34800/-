function main() {

  // var for board, player turn(whoseTurn) 

  var boardContent = ["e", "e", "e", "e", "e", "e", "e", "e", "e"];
  var whoseTurn = 1;
  var possibleWin;
  var scoreCounterX = 0;
  var scoreCounterO = 0;
  var winnerIs;
  var blockBoard;
  var AISwitch;
  var animation;


  // winning combination (Keep 'em in a function so it's up to date when it's called)

  function winKeeper() {
    possibleWin = {
      "h1":[boardContent[0], boardContent[1], boardContent[2]],
      "h2":[boardContent[3], boardContent[4], boardContent[5]],
      "h3":[boardContent[6], boardContent[7], boardContent[8]],
      "v1":[boardContent[0], boardContent[3], boardContent[6]],
      "v2":[boardContent[1], boardContent[4], boardContent[7]],
      "v3":[boardContent[2], boardContent[5], boardContent[8]],
      "d1":[boardContent[0], boardContent[4], boardContent[8]],
      "d2":[boardContent[2], boardContent[4], boardContent[6]]
    };
  }


  function isThereaWin() {
    winKeeper();
    for (var prop in possibleWin) {
      if (!possibleWin.hasOwnProperty(prop)) {
              continue;
          }
      var winCheck = possibleWin[prop];

      if ((winCheck[0] !== "e") && (winCheck[0] === winCheck[1]) && (winCheck[0] === winCheck[2])) {
        return [winCheck[0], true];
      }
    }
  }


  function isThereaDraw() {
    winKeeper();
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
  }


  function refreshStatus(status) {
    var el = document.getElementById("status");
    var playerTurn;

    el.innerHTML = "";

    if (whoseTurn === 1) {
      playerTurn = "it's player X turn.";
    }
    else if (whoseTurn === 2) {
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

  }


  // function that reset the board (you don't say?)

  function resetBoard() {
    whoseTurn = 1;
    boardContent = ["e", "e", "e", "e", "e", "e", "e", "e", "e"];
    refreshBoard();
  }

  
  function refreshBoard() {
    for (var i = 0; i < boardContent.length; i++) {
      var squareNumber = i + 1;
      var id ="square" + squareNumber;
      var el = document.getElementById(id);

      el.value = " ";
      el.classList.remove("redXState");
      el.classList.remove("blueOState");

      if ( boardContent[i] === "x") {
        el.value = "X";
        el.classList.add("redXState");

      }
      else if ( boardContent[i] === "o") {
        el.value = "O";
        el.classList.add("blueOState");
      }
    }
  }


  function refreshScore() {
    document.getElementById("scoreO").innerHTML = "Score O: " + scoreCounterO;
    document.getElementById("scoreX").innerHTML = "Score X: " + scoreCounterX;
    if ((scoreCounterO === 3) || (scoreCounterX === 3)) {
      if (scoreCounterX === 3) {
        winnerIs = "x";
      }
      else if (scoreCounterO === 3) {
        winnerIs = "o";
      }
    }
  }



  // Pretty moving colours

  function winAnimation(winner) {
    resetBoard();
    var counter = 0;
    boardContent.unshift(winner);
    boardContent.pop();
    refreshBoard();
    animation = setInterval(function() {
      if (counter < 9) {
        boardContent.unshift("e");
        boardContent.pop();
        refreshBoard();
        counter++;
      }
      else {
        boardContent.unshift(winner);
        boardContent.pop();
        refreshBoard();
        counter = 0;
      }
    } , 300);
  }


  // Function get current player move
  // loop that create button event listener

  function getInput() {

    var arraySquareElement = document.getElementsByClassName("square");

    for (i = 0; i < arraySquareElement.length; i++) {
      var squareNumber = i + 1; 
      
      var id ="square" + squareNumber;

      var el = document.getElementById(id);

      el.addEventListener("click", function(){
        var whichCase = (parseInt(this.id.substr(this.id.length - 1)) - 1);

        if (blockBoard !== true) {

          if (boardContent[whichCase] === "e") {

            if (whoseTurn === 1) {
              boardContent[whichCase] = "x";
              if (AISwitch) {
                getAIInput();
              }
              else {
                whoseTurn = 2;
              }
              refreshStatus();
            }

            else if (whoseTurn === 2) {
              boardContent[whichCase] = "o";
              whoseTurn = 1;
              refreshStatus();
            }

            refreshBoard();
            // not sure if I should put isThereawin() in a variable instead of calling it twice
            if(typeof isThereaWin() !== 'undefined') {

              if (isThereaWin()[0] === "x") {
                scoreCounterX++;
                resetBoard();
                refreshScore();
                if (scoreCounterX === 3) {
                  refreshStatus("XWinsGame");
                  winAnimation("x");
                  blockBoard = true;
                }
                else {
                  refreshStatus("XWinsTurn");
                }
              }

              else {
                scoreCounterO++;
                resetBoard();
                refreshScore();
                if (scoreCounterO === 3) {
                  refreshStatus("OWinsGame");
                  winAnimation("o");
                  blockBoard = true;
                }
                else {
                  refreshStatus("OWinsTurn");
                }
              }

            }

            if (isThereaDraw()) {
              resetBoard();
              refreshStatus("draw");
            }
          }
        }
      });

    }
  }


  // event listener for reset button

  document.getElementById("reset").addEventListener("click", function() {
    blockBoard = false;
    scoreCounterX = 0;
    scoreCounterO = 0;
    whoseTurn = 1;
    clearInterval(animation);
    refreshStatus();
    refreshScore();
    resetBoard();
  });


  // event listener for different mode.

  document.getElementById("p1vp2").addEventListener("click", function() {
    document.getElementById("p1vp2").style.backgroundColor='#55779a';
    document.getElementById("p1vcpu").style.backgroundColor='';
    blockBoard = false;
    scoreCounterX = 0;
    scoreCounterO = 0;
    refreshScore();
    AISwitch = false;
    refreshStatus();
    clearInterval(animation);
    resetBoard();
    getInput();
  });

  document.getElementById("p1vcpu").addEventListener("click", function() {
    document.getElementById("p1vcpu").style.backgroundColor='#55779a';
    document.getElementById("p1vp2").style.backgroundColor='';
    blockBoard = false;
    scoreCounterX = 0;
    scoreCounterO = 0;
    refreshScore();
    AISwitch = true;
    refreshStatus();
    clearInterval(animation);
    resetBoard();
    getInput();
  });

  // AI
  function getAIInput() {
    var emptyValue = false;
    while(!emptyValue) {
      var arrayLength = boardContent.length - 1;
      var random = Math.floor(Math.random() * (arrayLength + 1));
      if (boardContent[random] === "e") {
        boardContent[random] = "o";
        return;
      }
    }  
  }

  // ???


  // PROFIT!!!


}

document.addEventListener("DOMContentLoaded", main);
