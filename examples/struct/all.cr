# struct.cr: 4 examples

# struct.cr:4 (001.cr)
struct Foo # < Struct
end

# struct.cr:17 (002.cr)
struct Mutable
  property value

  def initialize(@value : Int32)
  end
end

def change_bad(mutable)
  mutable.value = 2
end

def change_good(mutable)
  mutable.value = 2
  mutable
end

mut = Mutable.new 1
change_bad(mut)
mut.value # => 1

mut = change_good(mut)
mut.value # => 2

# struct.cr:53 (003.cr)
struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

p1 = Point.new 1, 2
p2 = Point.new 1, 2
p3 = Point.new 3, 4

p1 == p2 # => true
p1 == p3 # => false

# struct.cr:89 (004.cr)
struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

p1 = Point.new 1, 2
p1.to_s    # "Point(@x=1, @y=2)"
p1.inspect # "Point(@x=1, @y=2)"
