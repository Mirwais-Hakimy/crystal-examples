# struct.cr:53
struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

p1 = Point.new 1, 2
p2 = Point.new 1, 2
p3 = Point.new 3, 4

p1 == p2 # => true
p1 == p3 # => false
