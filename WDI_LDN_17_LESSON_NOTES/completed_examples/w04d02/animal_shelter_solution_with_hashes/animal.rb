class Animal
  attr_accessor :name, :age, :gender, :species, :toys

  def initialize(name, age, gender, species)
    self.name = name
    self.age = age
    self.gender = gender
    self.species = species
    @toys = []
  end

  def to_s
    "#{name} is a #{age} year old #{gender} #{species} that loves #{toys.join(', ')}"
  end
end