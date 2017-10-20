def add_sheltered_animals
  dog1 = Animal.new("Tony", "Labrador", "4", "male", "Squicky Thing")
  dog2 = Animal.new("Rachel", "Teckel", "5", "female", "Plastic Bone")
  dog3 = Animal.new("Del", "a cat", "2", "male", "Ball")
  dog4 = Animal.new("Rex", "Alien Dog", "6", "male", "Duck")
  dog5 = Animal.new("Mattie", "Terrier", "10", "female", "Piece of rope")
  dog6 = Animal.new("Medor", "Poodel", "9", "male", "Ball")

  @my_shelter.animals.push(dog1, dog2, dog3, dog4, dog5, dog6)
end