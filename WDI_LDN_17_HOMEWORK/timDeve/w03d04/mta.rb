# Declare Array for lines

@line_n = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
@line_l = ["8th", "6th", "Union Square", "3rd", "1st"]
@line_6 = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]



# get stations & lines from the user

puts "starting station:"
@starting_station = gets.chomp
puts "starting line:"
starting_line = gets.chomp

puts "ending station:"
@ending_station = gets.chomp
puts "ending line:"
ending_line = gets.chomp



# Function to create the index for the different stations, takes two argument:
# **line: the line for which you want the station index, accept "n", "6" or "l"
# **end_or_start: if it the station of the start or the end, accept "starting" or "ending"

def get_index_for_stations(line, end_or_start)
  starting_station_command = "@line_" + line + ".index @" + end_or_start + "_station"
  starting_union_square_command = "@line_" + line + ".index 'Union Square'"
  starting_station_index = eval starting_station_command
  starting_union_square_index = eval starting_union_square_command

  return [starting_station_index, starting_union_square_index]

end



# get the indexes and store them in a variable

index_starting = get_index_for_stations(starting_line, "starting")
index_ending = get_index_for_stations(ending_line, "ending")



#  Check if the starting station and the ending one is on the same line

if starting_line != ending_line
  starting_difference = index_starting[1] - index_starting[0]
  starting_difference = starting_difference.abs

  ending_difference = index_ending[1] - index_ending[0]
  ending_difference = ending_difference.abs


  full_length = starting_difference + ending_difference

  puts "Take the '" + starting_line + " line' for " + starting_difference.to_s + " Stop(s), change at Union Square then take the '" + ending_line + " line' for " + ending_difference.to_s + " stop(s). That's " + full_length.to_s + " stop(s) in total."


elsif starting_line == ending_line
  full_length = index_starting[0] - index_starting[1]
  full_length = full_length.abs

  puts "Take the '" + starting_line + " line' for " + full_length.to_s + " Stop(s)."

end