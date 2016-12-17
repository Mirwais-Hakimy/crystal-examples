# macros.cr:33
record Point, x : Int32 = 0, y : Int32 = 0

Point.new      # => #<Point(@x=0, @y=0)>
Point.new y: 2 # => #<Point(@x=0, @y=2)>
