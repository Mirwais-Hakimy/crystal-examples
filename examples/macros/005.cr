# macros.cr:53
record Point, x = 0, y = 0

p = Point.new y: 2 # => #<Point(@x=0, @y=2)>
p.copy_with x: 3   # => #<Point(@x=3, @y=2)>
p                  # => #<Point(@x=0, @y=2)>
