# object.cr:1108
class Person
  def initialize(@name, @age)
  end

  # Define a hash(hasher) method based on @name and @age
  def_hash @name, @age
end
