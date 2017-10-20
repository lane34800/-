puts "Fist Number:"
number1 = gets.chomp.to_f
puts "Second Number:"
number2 = gets.chomp.to_f

result = number1 * number2
resultLastTwo = result.to_s[1..-1]


puts "Result:"

if resultLastTwo === ".0"
  puts result.to_i
else 
  puts result
end
