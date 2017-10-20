class Airport

  attr_reader :name
  attr_accessor :flights

  def initialize(name)
    @name = name
    @flights = []
  end

end