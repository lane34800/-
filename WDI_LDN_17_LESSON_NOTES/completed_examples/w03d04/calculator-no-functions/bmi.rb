puts "Do you want to enter your details in (m)etric or (i)mperial?"
measurement = gets.chomp.downcase

case measurement
  when 'i'
    print "weight pounds: "
    weight = gets.to_f
    print "height in inches: "
    height = gets.to_f
    puts "Your BMI is #{(weight/(height**2))*703}"
  when 'm'
    print "weight kilograms: "
    weight = gets.to_f
    print "height in meters: "
    height = gets.to_f
    puts "Your BMI is #{(weight/(height**2))}"
  else
    puts "invalid option"
end