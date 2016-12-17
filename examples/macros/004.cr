# macros.cr:43
record Point, x = 0, y = 0

Point.new      # => #<Point(@x=0, @y=0)>
Point.new y: 2 # => #<Point(@x=0, @y=2)>
