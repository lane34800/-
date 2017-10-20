# Generate an array representing a standard 52 card deck, each card is +++
# represented by hash containing it's suit, rank and value. It is used +++
# as a default deck, it is copied later in an other deck to be manipulated.

def deck_creator
  deck = []
  suits = ["♠", "♥", "♦", "♣"]
  ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

  suits.each do |value|
    current_suit = value

    ranks.each do |value|
      card = {}
      card[:suit] = current_suit
      card[:rank] = value
      if value === "A"
        card[:value] = 1
      elsif ["J", "Q", "K"].include?(value)
        card[:value] = 10
      else
        card[:value] = value.to_i
      end

      deck.push(card)
    end
  end
  return deck
end



# Grab (delete) a card from the current deck, and put it in one of the hands.
# it takes one argument:
# **which_hand: choose which to put the card in, accepts either "dealer" or "player"

def get_card_and_put_in_hand(which_hand)
  the_card = @deck_current.delete_at(rand(@deck_current.length))

  if which_hand === "dealer"
    @hand_dealer.push(the_card)

  elsif which_hand === "player"
    @hand_player.push(the_card)

  end
  
end



# Once a game is lost this function is called to determine the amount of money +++
# that should be taken or given to the player. 

def bet_attribution(state_of_game)
  if state_of_game === "lose"
    @money_current = @money_current - @money_bet
  elsif state_of_game === "win"
    @money_current = @money_current + (@money_bet * 0.5)
    @money_current = @money_current.to_i
  end
  @money_bet = 0
end
    


# Calculate the cumulated value of the card in a given hand, it is given an array +++
# representing the hand, and return an array of two integers, the first represent +++
# the soft hand (a hand without ace or ace but valued as 1), the second represent +++
# the hard hand (a hand with an ace valued as 11). If there is no aces the soft   +++
# hand is returned normally and the hard hand value set at 999. it takes one      +++
# argument:
# **hand_array: represent a player hand, accept an array.

def calculate_hand_total_value(hand_array)
  total_value = 0
  is_there_an_ace = false

  hand_array.each do |card|
    if card[:rank] === "A"
      is_there_an_ace = true
    end

    card_value = card[:value]
    total_value += card_value

  end

  if is_there_an_ace
    return [total_value, total_value + 10]

  else
    return [total_value, 999]

  end

end



# Ask the user for input and check if it fit one of the accepted input +++
# takes one argument:
# **acceptable_input: an array representing the accepted answers

def get_user_input_and_check(acceptable_input)
  input = gets.chomp.downcase

  if acceptable_input.include? input
    return input

  else
    puts "This is not an acceptable input ('#{acceptable_input.join("', '")}'), please try again:"
    get_user_input_and_check(acceptable_input)

  end

end



# check if a string represent an integer, return true or false accepts one argument:
# **string: the string to be check for integer

def is_integer(string)
    string.to_i.to_s == string
end



# Ask the user for input at the betting screen, check if it the bet is not more +++
# than what the user currently own, if it fit between the 5€/100€ window and if +++
# it is an integer at all. Ask the user for the input again if it does not fit  +++
# the criteria. Returns the string as an integer if it does fit.

def get_betting_input_and_check
  input = gets.chomp
  
  if input === "q"
    abort("Bye, bye!")

  elsif is_integer(input)
    input_i = input.to_i

    if input_i > @money_current
      puts "You don't have enough money"
      get_betting_input_and_check

    elsif input_i > 100 || input_i < 5
      puts "Bet too big or too small"
      get_betting_input_and_check

    else
      return input_i

    end

  else
    puts "Invalid input please try again:"
    get_betting_input_and_check
  end

end



# Display the betting screen and call the method for the betting input then +++
# if the input is acceptable launch the game. it takes one argument:
# **first_time: Display the welcome string if true 

def display_betting_screen(first_time)
  system "clear" or system "cls"

  if first_time
    puts "*** Welcome to Ruby Blackjack ***"
  end

  puts "You have #{@money_current} €."
  puts "Place your bet (min: 5€, max: 100€) or press (q)uit to exit"
  

  @money_bet = get_betting_input_and_check
  start_game
end



# Display (and refresh) the board screen, call the generate_ASCII_card method  +++
# and the concatenate_cards to display the player hands, it takes one argument:
# **hidden_dealer: accept true or false, if true the second card of the dealer +++
# will be hidden.

def display_board_screen(hidden_dealer)
  display_hand_dealer = []
  display_hand_player = []

  if hidden_dealer
    dealer_card = [generate_ASCII_card(@hand_dealer[0]),generate_ASCII_card(@hidden_card)]
    display_hand_dealer = concatenate_cards(dealer_card)

  else
    dealer_card = []
    @hand_dealer.each do |card|
      dealer_card.push(generate_ASCII_card(card))
    end
    display_hand_dealer = concatenate_cards(dealer_card)
  end
  

  @hand_player.each do |card|
    player_card = []
    @hand_player.each do |card|
      player_card.push(generate_ASCII_card(card))
    end
    display_hand_player = concatenate_cards(player_card)
  end

  system "clear" or system "cls"
  puts "Dealer:"
  puts display_hand_dealer
  puts
  puts "Player:"
  puts display_hand_player
  puts
  puts "Do you want to (h)it or (s)tay?"
end



# Check if a given hand has a total over 21, both hard and soft hand needs +++
# to be higher than 21. Takes one argument:
# **hand_total: accept an array representing the total value of a given hand.

def check_if_over_21(hand_total)
  if hand_total[0] > 21 && hand_total[1] > 21
    return true

  else
    return false

  end
end



# Check if a given hand has a total over 17, either hard or soft hand can +++
# be higher than 17, only used for the dealer. Takes one argument:
# **hand_total: accept an array representing the total value of a given hand.

def check_if_over_17(hand_total)
  if hand_total[1] === 999
    if hand_total[0] >= 17
      return true
    end

  else
    if hand_total[0] >= 17 || hand_total[1] >= 17
      return true
    end

  end

  return false

end



# Compare the dealer and the player hands to determine who wins, it  +++
# returns either the winner ("dealer" or "player") or draw if it's   +++
# the case, takes two arguments:
# **hand_total_dealer: an array representing the the total value of  +++
# the dealer hand.
# **hand_total_player: an array representing the the total value of  +++
# the player hand.

def check_who_wins(hand_total_dealer, hand_total_player)
  hand_to_use_dealer = 0
  hand_to_use_player = 0

  if hand_total_dealer[1] <= 21
    hand_to_use_dealer = hand_total_dealer[1]
  else
    hand_to_use_dealer = hand_total_dealer[0]
  end

  if hand_total_player[1] <= 21
    hand_to_use_player = hand_total_player[1]
  else
    hand_to_use_player = hand_total_player[0]
  end

  if hand_to_use_player < hand_to_use_dealer
    return "dealer"
  elsif hand_to_use_dealer < hand_to_use_player
    return "player"
  elsif hand_to_use_player = hand_to_use_dealer
    return "draw"
  end

end



# Asks the player for input, to choose if the player want to hit  +++
# or stay, it returns "over" if the player is over 21 and stay if +++
# the player stays. recursively calls itself if the previous      +++
# conditions are not met.
 
def turn_player
  input = get_user_input_and_check(["h","s"])
  if input === "h"

    get_card_and_put_in_hand("player")
    display_board_screen("hidden")
    hand_total = calculate_hand_total_value(@hand_player)
    if check_if_over_21(hand_total)
      return "over"
    else
      turn_player
    end

  elsif input === "s"
    return "stay"
  end
end



# get card for the dealer until their value is higher than 21     +++
# (returns "over21") or 17 (returns "over17"). reccursively calls +++
# itself if the previous conditions are not met.

def turn_dealer
  display_board_screen(false)
  hand_total = calculate_hand_total_value(@hand_dealer)

  if check_if_over_21(hand_total)
    return "over21"
  elsif check_if_over_17(hand_total)
    return "over17"
  else
    get_card_and_put_in_hand("dealer")
    sleep 1
    turn_dealer
  end
end


# Generate one ASCII card, returns an array representing the seven +++
# strings needed to build the cards. Accepts one argument:
# **card: a hash representing a single card

def generate_ASCII_card(card)

  if card[:rank] === "10"
    rank = card[:rank]
  else
    rank = " " + card[:rank] 
  end

  suit = card[:suit]

  array_card = []
  array_card.push(".-------.")
  array_card.push("| #{rank} #{suit}  |")
  array_card.push("|       |")
  array_card.push("|       |")
  array_card.push("|       |")
  array_card.push("|  #{rank} #{suit} |")
  array_card.push("'-------'")
  
  return array_card
end



# Concatenate the previously created ASCII cards. returns an array +++
# representing the seven strings needed to build the hands. Accepts+++ 
# one argument:
# **cards: an array of arrays representing each ASCII card in hand. 

def concatenate_cards(cards)
  array_hand = ["","","","","","",""]
  cards.each do |value|
    value.each_with_index do |string, index|
      array_hand[index] = array_hand[index] + " " + string
    end
  end

  return array_hand
end



# Start a game round and launch the apropriate methods to display +++
# the diverse screens.

def start_game
  @deck_current = @deck_default
  @hand_dealer = []
  @hand_player = []
  get_card_and_put_in_hand("dealer")
  get_card_and_put_in_hand("dealer")
  get_card_and_put_in_hand("player")
  get_card_and_put_in_hand("player")

  display_board_screen(true)

  result_player = turn_player

  if result_player === "over"
    puts "player is over 21, press enter to continue"
    gets
    bet_attribution("lose")
    display_betting_screen(false)
  elsif result_player === "stay"
    result_dealer = turn_dealer
  end
  
  if result_dealer === "over21"
    puts "Dealer over 21, press enter to continue"
    gets
    bet_attribution("win")
    display_betting_screen(false)
  elsif result_dealer === "over17"
    final_result = check_who_wins(calculate_hand_total_value(@hand_dealer), calculate_hand_total_value(@hand_player))
    if final_result === "draw"
      puts "It's a draw, press enter to continue"
      bet_attribution("push")
    elsif final_result === "player"
      puts "Player wins, press enter to continue"
      bet_attribution("win")
    elsif final_result === "dealer"
      puts "Dealer wins, press enter to continue"
      bet_attribution("lose")
    end
      
    gets
    display_betting_screen(false)
  end

end


# Declare necessary properties

@deck_default = deck_creator
@deck_current = @deck_default

@hidden_card = {
  value: 0,
  suit: "?",
  rank: "?"
}


@hand_dealer = []
@hand_player = []
@money_current = 100
@money_bet = 0


# Init

display_betting_screen(true)