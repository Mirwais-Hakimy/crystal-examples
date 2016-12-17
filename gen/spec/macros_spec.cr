require "spec"

puts "# macros.cr:12 (001.cr)" # :nocode: :example:
record Point, x : Int32, y : Int32

( Point.new 1, 2 ).class.to_s.should eq( "Point" )

puts "# macros.cr:20 (002.cr)" # :nocode: :example:
record Person, first_name : String, last_name : String do
  def full_name
    "#{first_name} #{last_name}"
  end
end

person = Person.new "John", "Doe"
( person.full_name ).to_s.should eq( "John Doe" )

puts "# macros.cr:33 (003.cr)" # :nocode: :example:
record Point, x : Int32 = 0, y : Int32 = 0

( Point.new ).class.to_s.should eq( "Point" )
( Point.new y: 2 ).class.to_s.should eq( "Point" )

puts "# macros.cr:43 (004.cr)" # :nocode: :example:
record Point, x = 0, y = 0

( Point.new ).class.to_s.should eq( "Point" )
( Point.new y: 2 ).class.to_s.should eq( "Point" )

puts "# macros.cr:53 (005.cr)" # :nocode: :example:
record Point, x = 0, y = 0

( p = Point.new y: 2 ).class.to_s.should eq( "Point" )
( p.copy_with x: 3 ).class.to_s.should eq( "Point" )
( p ).class.to_s.should eq( "Point" )

puts "# macros.cr:124 (006.cr)" # :nocode: :example:
a = 1
pp! a # => "a # => 1"

pp! [1, 2, 3].map(&.to_s) # => "[1, 2, 3].map(&.to_s) # => ["1", "2", "3"]"

puts "# macros.cr:158 (007.cr)" # :nocode: :example:
a = 1
p! a # => "a # => 1"

p! [1, 2, 3].map(&.to_s) # => "[1, 2, 3].map(&.to_s) # => ["1", "2", "3"]"

