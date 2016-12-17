# struct.cr:89
struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

p1 = Point.new 1, 2
p1.to_s    # "Point(@x=1, @y=2)"
p1.inspect # "Point(@x=1, @y=2)"
