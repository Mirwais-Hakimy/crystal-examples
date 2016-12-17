# object.cr:1130
class Person
  def initialize(@name, @age)
  end

  # Define a `==` method that compares @name and @age
  def_equals @name, @age
end
