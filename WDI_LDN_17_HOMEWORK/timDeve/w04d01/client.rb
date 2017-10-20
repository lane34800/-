class Client

  attr_accessor :pets
  attr_reader :name, :age, :gender

  def initialize(name, age, gender, pets=[])
    @name = name
    @age = age
    @gender = gender
    @pets = pets
  end

  def number_of_pet
    @pets.length
  end

  def list_animals
    @pets.each_with_index do |animal, index|
      name = animal.name
      age = animal.age
      breed = animal.breed
      puts "#{index + 1}) #{name} (#{breed}, #{age} year's old)"
    end
  end


end