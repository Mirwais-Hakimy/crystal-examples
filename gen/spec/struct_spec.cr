require "spec"

puts "# struct.cr:4 (001.cr)" # :nocode: :example:
struct Foo # < Struct
end

puts "# struct.cr:17 (002.cr)" # :nocode: :example:
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
( mut.value ).should eq( 1 )

mut = change_good(mut)
( mut.value ).should eq( 2 )

puts "# struct.cr:53 (003.cr)" # :nocode: :example:
struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

p1 = Point.new 1, 2
p2 = Point.new 1, 2
p3 = Point.new 3, 4

( p1 == p2 ).should eq( true )
( p1 == p3 ).should eq( false )

puts "# struct.cr:89 (004.cr)" # :nocode: :example:
struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

p1 = Point.new 1, 2
p1.to_s    # "Point(@x=1, @y=2)"
p1.inspect # "Point(@x=1, @y=2)"

