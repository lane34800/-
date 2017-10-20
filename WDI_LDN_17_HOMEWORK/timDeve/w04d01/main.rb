require_relative "shelter"
require_relative "client"
require_relative "animal"
require_relative "shelteredAnimals"

@my_shelter = Shelter.new("Pets Heaven", 10)
add_sheltered_animals
user_input = ""

def menu
  system "clear" or system "cls"
  puts "Welcome to #{@my_shelter.name}."
  puts "1) List animals"
  puts "2) Add a client"
  puts "3) List the clients"
  puts "4) Adopt an animal"
  puts "5) Give up an animal"
  puts "6) Put down an animal"

  if @my_shelter.get_current_availability < 0
    puts "There is too many animals in the shelter \nwe're gonna have to let some go..."
  end
  
  gets.chomp
end

while user_input.downcase != "q"
  user_input = menu

  case user_input
    when "1"
      system "clear" or system "cls"
      if @my_shelter.animals == []
        print "Sorry there is no animal in the shelter, press enter to go back to the menu"
        gets
      else
        @my_shelter.list_animals
        print "Enter to return to menu"
        gets
      end
    when "2"
      system "clear" or system "cls"
      @my_shelter.add_client
    when "3"
      system "clear" or system "cls"
      if @my_shelter.clients == []
        print "Sorry client list is empty, press enter to go back to the menu"
        gets
      else
        @my_shelter.list_clients
        print "Enter to return to menu"
        gets
      end
    when "4"
      system "clear" or system "cls"
      if @my_shelter.clients == []
        print "Sorry client list is empty, press enter to go back to the menu"
        gets
      elsif @my_shelter.animals == []
        print "Sorry there is no animal in the shelter, press enter to go back to the menu"
        gets
      else
        @my_shelter.list_clients
        puts "Which Client?"
        client_index = gets.chomp.to_i - 1
        @my_shelter.list_animals
        puts "Which Animal?"
        animal_index = gets.chomp.to_i - 1
        animal = @my_shelter.animals.delete_at(animal_index)
        @my_shelter.clients[client_index].pets.push(animal)
      end
      
    when "5"
      system "clear" or system "cls"
      if @my_shelter.clients == []
        print "Sorry client list is empty, press enter to go back to the menu"
        gets
      else
        @my_shelter.list_clients
        puts "Which Client?"
        client_index = gets.chomp.to_i - 1
        @my_shelter.clients[client_index].list_animals
        puts "Which Animal?"
        animal_index = gets.chomp.to_i - 1
        animal = @my_shelter.clients[client_index].pets.delete_at(animal_index)
        @my_shelter.animals.push(animal)
      end

    when "6"
      system "clear" or system "cls"
      @my_shelter.list_animals
      puts "Which Animal?"
      animal_to_delete = gets.chomp.to_i - 1
      @my_shelter.put_down(animal_to_delete)
  end

end