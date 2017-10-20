class Person
  
  def initialize(name)
    @name = name
  end

  def sayHello
    puts "Hello, I'm " + @name + "."
  end
  
end


myPerson = Person.new("Tim")

myPerson.sayHello