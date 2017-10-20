NUMBER_OF_DECKS = 6
SUITS           = %w(♤ ♡ ♢ ♧) 
VALUES          = ("2".."10").to_a + %w(J Q K A)
MIN_STAKE       = 5

## Creating new deck with map
# def new_deck
#   SUITS.map do |suit|
#     VALUES.map { |value| value+suit }
#   end.flatten
# end

## Creating a new deck with .product
def new_deck
  VALUES.product(SUITS).map(&:join)
end

def shuffle_deck
  new_deck.shuffle
end

def new_shoe
  NUMBER_OF_DECKS.times.map { shuffle_deck }.flatten
end

def cant_bet_more_than_you_have?(chips, stake)
  stake.to_i > chips
end

def cant_bet_less_than_minimum?(stake)
  stake.to_i < MIN_STAKE
end 

def invalid_bet?(chips, stake)
  return true if !stake
  cant_bet_more_than_you_have?(chips, stake) || cant_bet_less_than_minimum?(stake)
end

def higher_than_16?(hand)
  total(hand) > 16
end

def bust?(hand)
  total(hand) > 21
end

def the_hand_is_over?(hand)
  higher_than_16?(hand) || bust?(hand)
end

def instant_win?(hand)
  total(hand) == 21
end

def total(hand)
  hand.reduce(0) do |sum, card|
    value = card.to_i
    
    if card.include?("A") && sum + 11 <= 21
            #if card is an ACE and it doesnt make the player bust
      sum + 11
    elsif card.include?("A") && sum + 1 <= 21
            #if card is an ACE and it DOES make the player bust
      sum + 1
    else
            #if card is a suit
      sum + ((value == 0) ? 10 : value)
    end
  end
end

def deal_card(hand, deck)
    #pop a value out of the DECK arr and shovel(push) it into DECK arr
  hand << deck.pop
end

def deal_cards(player_cards, dealer_cards, deck)
  4.times do |i| 
    i.even? ? deal_card(player_cards, deck) : deal_card(dealer_cards, deck) 
  end
end

def deal_for_dealer(hand, deck)
  until the_hand_is_over?(hand)
    deal_card(hand, deck)
  end
end

def winner(player_cards, dealer_cards)
  return "You" if bust?(dealer_cards)
  total(player_cards) >= total(dealer_cards) ? "You" : "The Dealer"
end

def stick_or_twist?(hand, deck)
  puts "Do you want to (s)tick or (t)wist?"
  answer = gets.chomp.downcase

  case answer
  when "s" then true
  when "t" 
    deal_card(hand, deck) 
    false
  else 
    puts "Please repeat..."
    false
  end
end

def display_cards(hand, revealed)
  hand     = hand.clone
  hand[-1] = "??" if !revealed
  puts "#{hand.join(" ")}\n\n"
end

def cash_out(chips, stake)
  chips += 2*stake
end

















def play
  over  = false
  chips = 100

  while !over
    stick        = false
    bust         = false
    winner       = nil
    stake        = nil
    player_cards = []
    dealer_cards = []
    deck         = new_shoe
    
    puts `clear`
    puts "*** Welcome to Ruby Blackjack ***"
    puts "You have £#{chips}"

    # Take the user's bet
    while invalid_bet?(chips, stake)
      puts "Place your bet (min: £#{MIN_STAKE}, max: £#{chips}) or press (q)uit to exit."
      stake = gets.chomp
      break if stake == "q"
      stake = stake.to_i
    end
    break if stake == "q"
    chips -= stake

    # Deal the cards to the player and the dealer
    deal_cards(player_cards, dealer_cards, deck)

    # Display the cards
    while !stick
      # check...
      break if bust?(player_cards)
      puts `clear`
      puts "Dealer's cards total: "
      display_cards(dealer_cards, false)
      puts "Your cards total: #{total(player_cards)}"
      display_cards(player_cards, true)
      stick = stick_or_twist?(player_cards, deck)
    end

    # Check for 21
    if instant_win?(player_cards)
      puts "Your cards total: #{total(player_cards)}"
      puts "The winner is you!"
      cash_out(chips, stake)
      puts "You have £#{chips}"
      gets
      next
    end

    # Check if player is bust
    if bust?(player_cards)
      puts "Your cards total: #{total(player_cards)}"
      puts "You are bust!"
      gets
      next
    end

    # Deal for dealer
    
    deal_for_dealer(dealer_cards, deck)

    # Check if dealer is bust
    if bust?(dealer_cards)
      puts "Dealer's cards total: #{total(dealer_cards)}"
      display_cards(dealer_cards, true)
      puts "The dealer is bust!"
      cash_out(chips, stake)
      puts "You have £#{chips}"
      gets
      next
    end

    puts `clear`
    puts "Your cards total: #{total(player_cards)}"
    puts "Dealer's cards total: #{total(dealer_cards)}"
    display_cards(dealer_cards, true)

    winner = winner(player_cards, dealer_cards)
    puts "The winner is: #{winner}"

    cash_out(chips, stake) if winner.downcase == "you"
    "You have £#{chips}"
    gets
  end

  puts "Thanks for playing. You walk proudly away with £#{chips}"
end

play
