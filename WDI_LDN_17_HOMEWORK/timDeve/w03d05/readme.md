![ga_cog_large_red_rgb](https://cloud.githubusercontent.com/assets/40461/8183776/469f976e-1432-11e5-8199-6ac91363302b.png)
WDI
===
## Make blackjack in Ruby

<img width="444" alt="screen shot 2015-10-16 at 16 05 04" src="https://cloud.githubusercontent.com/assets/40461/10545269/c0b6d84e-741f-11e5-9860-6ffe75ab75a9.png">


Your weekend task is to create the game "blackjack" in Ruby to be displayed and played in the console. 

### Tasks

- Write the pseudo-code for the game in a file called `planning.md`
- Then create the game using functions in the simplest way that you can
- If you get a working version of the game - refactor the code to be as "Rubyesque" as possible.


### Bonus
- Add some cool ASCII art to your game! 


## The Game Objectives

Although many players may play in a single round of blackjack, it's fundamentally a two-player game. In blackjack, players don't play against each other; and they don't co-operate. The only competition is the dealer.

The aim of the game is to accumulate a higher point total than the dealer, but without going over 21. You compute your score by adding the values of your individual cards.

The cards 2 through 10 have their face value, J, Q, and K are worth 10 points each, and the Ace is worth either 1 or 11 points (player's choice).

### The deal and "blackjack"

At the start of a blackjack game, the players and the dealer receive two cards each. The players' cards are normally dealt face up, while the dealer has one face down (called the hole card) and one face up.

The best possible blackjack hand is an opening deal of an ace with any ten-point card. This is called a "blackjack", or a natural 21, and the player holding this automatically wins unless the dealer also has a blackjack. If a player and the dealer each have a blackjack, the result is a push for that player. If the dealer has a blackjack, all players not holding a blackjack lose.

### The players' turns

The player can keep his hand as it is (stand) or take more cards from the deck (hit), one at a time, until either the player judges that the hand is strong enough to go up against the dealer's hand and stands, or until it goes over 21, in which case the player immediately loses (busts).

In most places, players can take as many cards as they like, as long as they don't bust, but some casinos have restrictions regarding this.

### The dealer's turn

When all players have finished their actions, either decided to stand or busted, the dealer turns over his hidden hole card.

If the dealer has a natural 21 (blackjack) with his two cards, he won't take any more cards. All players lose, except players who also have a blackjack, in which case it is a push - the bet is returned to the player.

If the dealer doesn't have a natural, he hits (takes more cards) or stands depending on the value of the hand. Contrary to the player, though, the dealer's action is completely dictated by the rules. The dealer must hit if the value of the hand is lower than 17, otherwise the dealer will stand.

### Showdown

If the dealer goes bust, the player wins.

For those with the same total as the dealer the result is a push: their stake is returned to them and they neither win nor lose.

Players with a blackjack win a bet plus a bonus amount, which is normally equal to half their original wager. A blackjack hand beats any other hand, also those with a total value of 21 but with more cards.

As described above, if the dealer has a blackjack, players with blackjack make a push, while all other players lose.

