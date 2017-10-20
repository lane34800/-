NUMBER_OF_DECKS = 6

def card_values_array
  ("2".."10").to_a + %w(J Q K A)
end

def new_deck
  %w(h d c s).inject([]) do |deck, color|
    deck + card_values_array.each {|value| value << color}
  end
end

def new_shoe
  shoe = []
  NUMBER_OF_DECKS.times {shoe+=new_deck}
  shoe.shuffle
end

def card_score(card_name, score_over_21)
  # dealer does not hit on a soft 17 in this version
  return card_name.to_i if card_name.to_i>0
  if(card_name[0]=="A")
    return 11 if !score_over_21
    return 1
  end
  10
end

def score(cards)
  score = cards.reduce(0) {|sum,card| sum + card_score(card,false)}
  return cards.reduce(0) {|sum,card| sum + card_score(card,true)} if score > 21
  score
end

def player_move(first_turn)
  if first_turn
    puts "Do you want to (h)it, (s)tay or (f)old?"
  else
    puts "Do you want to (h)it or (s)tay?"
  end
  gets.chomp
end

def show_cards(first_turn)
  # puts `clear`
  puts "   *** Welcome to Ruby Blackjack ***   "
  puts "\nDealer"
  if !first_turn
    card_images(@cards[:dealer])
  else
    card_images([@cards[:dealer][0]]+["???"])
  end
  puts "Player"
  card_images(@cards[:player])
end

def card_images(cards)
  lines=[]
  lines.push([])
  cards.length.times{lines[0]+=top_border}
  4.times do |i| 
    lines.push([])
    cards.length.times{lines[i+1]+=middle_line}
  end
  lines.push([])
  cards.length.times{lines[5]+=bottom_border}
  cards.each_with_index do |card, i|
    if card.length < 3
      lines[1][i*3+1][0]=color_image(card[1])
      lines[4][i*3+1][4]=color_image(card[1])
      lines[1][i*3+1][2]=card[0]
      lines[4][i*3+1][3]=card[0]
    else
      lines[1][i*3+1][0]=color_image(card[2])
      lines[4][i*3+1][4]=color_image(card[2])
      lines[1][i*3+1][3]=card[1]
      lines[4][i*3+1][3]=card[1]
      lines[1][i*3+1][2]=card[0]
      lines[4][i*3+1][2]=card[0]
    end
  end
  lines.each do |line|
    line.each {|char| print char}
    print "\n"
  end
  puts
end

def top_border
  top_border = %W(\u256D \u256E)
  6.times {top_border.insert(1,"\u2500")}
  top_border
end

def middle_line
  middle_part = ["\u2502","      " ,"\u2502"]
end

def bottom_border
  bottom_border = %W(\u2570 \u256F)
  6.times {bottom_border.insert(1,"\u2500")}
  bottom_border
end

def color_image(color)
  case color
  when "h" then "\u2661"
  when "d" then "\u2662"
  when "c" then "\u2663"
  when "s" then "\u2660"
  else " "
  end
end

def new_game? 
  @bet = 0
  puts `clear`
  puts "*** Welcome to Ruby Blackjack ***"
  puts "You have \u00A3 #{@chips}."
  puts "Place your bet (min: \u00A35, max: \u00A3#{@chips}) or press (q)uit to exit."
  answer = gets.chomp
  while answer.to_i > @chips || answer.to_i < 5
    return false if answer == "q"
    puts "Enter a valid bet (min: \u00A35, max: \u00A3#{@chips}) or (q)uit."
    answer = gets.chomp
  end
  @bet = answer.to_i
  @chips -= @bet
  true
end

def determine_winner
  if (@scores[:player] == @scores[:dealer])
    puts "Push!"
    @chips+=@bet
    "tie"
  elsif (@scores[:player] > 21)
    puts "Player went bust"
    "Dealer"
  elsif (@scores[:dealer] > 21)
    puts "Dealer went bust"
    @chips += 2*@bet
    "Player"
  elsif (@scores[:player] > @scores[:dealer])
    @chips += 2*@bet
    "Player"
  else
    "Dealer"
  end
end

def stop_game?
  score21 = (@scores[:player] == 21 && @scores[:dealer] >= 17)
  return true if ((@scores[:player] > 21 || @scores[:dealer] > 21) || score21)
  false
end

def blackjack?
  if (@scores[:player] == 21 && @scores[:dealer] !=21)
    puts "*** BLACKJACK ***"
    @chips += 3*@bet/2
    return true
  end
  false
end

def take_card(current_player)
  @deck = new_shoe if @deck.length < NUMBER_OF_DECKS*52/2
  @cards[current_player].push(@deck.pop)
  update_scores
end

def update_scores
  @scores[:player]=score(@cards[:player])
  @scores[:dealer]=score(@cards[:dealer])
end

@deck = []
@cards = {}
@scores = {}
@chips = 100
@bet = 0

while new_game?
  @cards[:dealer] = []
  @cards[:player] = []
  @scores[:dealer] = 0
  @scores[:player] = 0
  2.times{take_card(:dealer)}
  2.times{take_card(:player)}
  show_cards(true)
  if !blackjack?
    response = player_move(true)
    while !stop_game?
      case response
      when "f"
        @chips += @bet/2
        break
      when "s"
        take_card(:dealer) while @scores[:dealer] < 17
        show_cards(false)
        break
      when "h"
        take_card(:player)
        take_card(:dealer) if @scores[:dealer] < 17
        show_cards(false)
        response = player_move(false) if !stop_game?
      else
        puts "Please choose one of the available options."
        if first_turn
          response = player_move(first_turn) while !(["s","h","f"].include?(response))
        else
          response = player_move(first_turn) while !(["s","h"].include?(response))
        end
      end
    end
  end

  if (response != "f")
    winner = determine_winner
    puts "#{winner} won the game." if winner != "tie"
    gets
  end
  if @chips < 5
    puts "You don't have enough chips to play anymore." 
    break
  end
end