class Person 

  # attr_reader :age, :name
  # attr_writer :age, :name

  attr_accessor :age, :name

  @@count = 0

  DEFAULT_NUMBER_OF_LEGS = 3

  def initialize (name, age)
    @@count += 1
    @name = name
    @age = age
  end

  def Person.count
    @@count 
  end


  def talk words

    puts "I can talk, look at me #{words}"
  end

  def self.change_default_leg_number number
    DEFAULT_NUMBER_OF_LEGS = number 
  end

end 


student1 = Person.new('BitchFace', 90)
student1.age = 3
#puts "the students name is #{student1.name} and she is #{student1.age} years old"

puts Person.count 
puts Person::DEFAULT_NUMBER_OF_LEGS

Person.change_default_leg_number(2)
puts Person::DEFAULT_NUMBER_OF_LEGS

