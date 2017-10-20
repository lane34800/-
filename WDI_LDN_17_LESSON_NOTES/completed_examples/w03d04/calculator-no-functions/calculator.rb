print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
operation = gets.chomp.downcase
print "first number: "
a = gets.to_f
print "second number: "
b = gets.to_f

case operation
when 'a'
  puts "#{a + b}"
when 's'
  puts "#{a - b}"
when 'm'
  puts "#{a * b}"
when 'd'
  puts "#{a / b}"
end