class Flight
  attr_reader :airline, :number_of_seats
  attr_accessor :passengers, :destination,  :flight_number

  def initialize(airline, number_of_seats)

    @airline = airline
    @number_of_seats = number_of_seats
    @passengers = []
     
  end

  def to_s

    "#{@airline} : (Seats: #{@number_of_seats}) - #{destination}"

  end

end