var Game = function() {

	this.currentPlayer = null;
	this.player = [];
	this.board = null;

	// we send this function to the board object so it can call it to tell
	// us that a piece has been played


	this.piecePlayedCallback = function() {

		if(this.board.checkForWin()) {

			this.endGame();

		} else {

			// this should toggle our current player between 0 and 1
			this.currentPlayer = this.currentPlayer ? 0 : 1;
			this.board.setCurrentPlayer(this.players[this.currentPlayer]);

		}

	}

	this.startGame = function() {

		console.log("Welcome to the game!");

		this.currentPlayer = 0;
		this.players = [new Player("Steve") , new Player("Niall")];
		// use bind to make this function run from out context
		this.board = new Board(this.players[0] , game.piecePlayedCallback.bind(game)); 
		this.board.reset();

	}

	this.endGame = function() {

		var winner = this.players[this.currentPlayer];
		alert("Game over!")

	}

}