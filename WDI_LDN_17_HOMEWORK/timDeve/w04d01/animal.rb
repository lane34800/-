class Animal

  attr_reader :name, :breed, :age, :gender, :favorite_toys

  def initialize(name, breed, age, gender, favorite_toys)
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    @favorite_toys = favorite_toys
  end

end