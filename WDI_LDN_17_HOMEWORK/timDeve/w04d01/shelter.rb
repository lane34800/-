class Shelter

  attr_accessor :clients, :animals
  attr_reader :name, :capacity 

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @animals = []
    @clients = []
  end


  def add_client
    puts "Client's name:"
    name = gets.chomp
    puts "Client's age:"
    age = gets.chomp.to_i
    puts "Client's gender:"
    gender = gets.chomp

    animals= []
    puts "Add animal (y/n)?"
    add_animal = gets.chomp

    while add_animal == "y"
      puts "Name:"
      animal_name = gets.chomp
      puts "Breed:"
      animal_breed = gets.chomp
      puts "Age:"
      animal_age = gets.chomp
      puts "Gender:"
      animal_gender = gets.chomp
      puts "Favorite Toy:"
      animal_toy = gets.chomp

      animal_this = Animal.new(animal_name, animal_breed, animal_age, animal_gender, animal_toy)
      animals.push(animal_this)

      puts "Add another one (y/n):"
      add_animal = gets.chomp
    end

    client = Client.new(name, age, gender, animals)
    @clients.push(client)
  end


  def list_animals
    @animals.each_with_index do |animal, index|
      name = animal.name
      age = animal.age
      breed = animal.breed
      puts "#{index + 1}) #{name} (#{breed}, #{age} year's old)"
    end
  end


  def list_clients
    @clients.each_with_index do |client, index|
      name = client.name
      number_animals = client.number_of_pet
      puts "#{index + 1} - #{name} (owns #{number_animals} pets)"
    end
  end


  def put_down(animal_index)
    @animals.delete_at(animal_index)
  end


  def get_current_availability
    @capacity - @animals.length
  end

end