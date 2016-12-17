# macros.cr: 7 examples

# macros.cr:12 (001.cr)
record Point, x : Int32, y : Int32

Point.new 1, 2 # => #<Point(@x=1, @y=2)>

# macros.cr:20 (002.cr)
record Person, first_name : String, last_name : String do
  def full_name
    "#{first_name} #{last_name}"
  end
end

person = Person.new "John", "Doe"
person.full_name # => "John Doe"

# macros.cr:33 (003.cr)
record Point, x : Int32 = 0, y : Int32 = 0

Point.new      # => #<Point(@x=0, @y=0)>
Point.new y: 2 # => #<Point(@x=0, @y=2)>

# macros.cr:43 (004.cr)
record Point, x = 0, y = 0

Point.new      # => #<Point(@x=0, @y=0)>
Point.new y: 2 # => #<Point(@x=0, @y=2)>

# macros.cr:53 (005.cr)
record Point, x = 0, y = 0

p = Point.new y: 2 # => #<Point(@x=0, @y=2)>
p.copy_with x: 3   # => #<Point(@x=3, @y=2)>
p                  # => #<Point(@x=0, @y=2)>

# macros.cr:124 (006.cr)
a = 1
pp! a # => "a # => 1"

pp! [1, 2, 3].map(&.to_s) # => "[1, 2, 3].map(&.to_s) # => ["1", "2", "3"]"

# macros.cr:158 (007.cr)
a = 1
p! a # => "a # => 1"

p! [1, 2, 3].map(&.to_s) # => "[1, 2, 3].map(&.to_s) # => ["1", "2", "3"]"
