def calc(first, operator, second=nil)
  if operator === "-"
    return first - second

  elsif operator === "+"
    return first + second

  elsif operator === "/"
    return first / second

  elsif operator === "*"
    return first * second

  elsif operator === "^"
    return first ** second

  elsif operator === "square"
    return Math.sqrt(first)

  end

end



puts "Type 'b' for basic calc"
calc_type = gets.chomp

if calc_type === "b"

  puts "Input first number:"
  first_number = gets.chomp.to_f

  puts "Input operator"
  operator = gets.chomp


  if operator === "square"
    output = calc(first_number, operator)

  else
    puts "Input second number:"
    second_number = gets.chomp.to_f
    output = calc(first_number, operator, second_number)

  end

end

puts output
    