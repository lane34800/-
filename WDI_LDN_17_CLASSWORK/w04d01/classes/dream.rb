class Dream
  attr_accessor :has_unicorn, :is_nightmare

  def initialize()
    @is_nightmare = false
    @has_unicorn = false

    if rand() < 0.95
      @has_unicorn = true
    end
  end

  def turn_to_nightmare
    @is_nightmare = true
  end
end

my_dream = Dream.new

puts my_dream.is_nightmare
my_dream.turn_to_nightmare
puts my_dream.is_nightmare
