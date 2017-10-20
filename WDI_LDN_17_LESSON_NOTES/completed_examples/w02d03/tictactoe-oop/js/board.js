var Board = function(startingPlayer , playerMovedCallback) {

	// get all the li elements as squares
	this.currentPlayer = startingPlayer;
	this.squares = document.querySelectorAll("div.board div.space");
	this.playerMovedCallback = playerMovedCallback;

	console.log("BOARD: Created");
	

	this.setCurrentPlayer = function(player) {

		this.currentPlayer = player;

	}

	this.createListeners = function() {

		for(i = 0; i < this.squares.length; i++) {

			this.squares[i].addEventListener("click" , this.handleSquareClicked);

		}

	}

	this.reset = function() {

		for(i = 0; i < this.squares.length; i++) {

			this.squares[i].value = "";

		}

	}

	this.checkForWin = function() {

		// win logic here
		return false;

	}

	// PRO TIP this will be overwritten in my function so i'm going to store a copy in self
	var self = this;

	this.handleSquareClicked = function(event) {

		if(self.currentPlayer != null) {

			// using the "this" scope which has been attached to my element
			this.innerHTML = "<div class='center'>" + self.currentPlayer.team + "</div>";

			// tell the game that the player moved using a callback
			self.playerMovedCallback();

		} else {

			console.log("No one is playing?!!!");

		}

	}

	// run my startup functions
	this.createListeners();


	


}