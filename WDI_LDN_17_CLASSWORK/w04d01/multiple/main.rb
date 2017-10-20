require_relative "airport"
require_relative "flight"
require_relative "passenger"



def menu

  puts `clear`
  puts "What would you like to do?"
  puts "1) Add a flight"
  puts "2) List flight"
  puts "3) Remove flight"
  puts "4) Add passenger to flight"
  puts "5) List passengers on flight"
  print "❯ "

  return gets.chomp

end



def add_fligth
  flight = Flight.new("Console Airways", "200")

  puts "Destination?"
  flight.destination = gets.chomp

  @airport.flights.push(flight)

end


def list_flights

  @airport.flights.each do |flight|
    puts flight.to_s
  end

  gets

end


@airport = Airport.new("LAX")

response = ""


while response.downcase != "q"

  response = menu

  case response

    when "1" 
      add_fligth
    when "2" 
      list_flights
    when "3" 
      puts "Adding fligth"
    when "4" 
      puts "Adding fligth"

  end

end


