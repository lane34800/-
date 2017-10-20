class Chair
  attr_accessor :color, :comfort

  def initialize(color, comfort)
    @color = color
    @comfort = comfort
  end
end

# red_chair = Chair.new("red", "5")
