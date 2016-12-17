# object.cr:1152
class Person
  def initialize(@name, @age)
  end

  # Define a hash method based on @name and @age
  # Define a `==` method that compares @name and @age
  def_equals_and_hash @name, @age
end
