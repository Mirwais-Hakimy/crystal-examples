require "spec"

puts "# range.cr:5 (001.cr)" # :nocode: :example:
# pending by 'file:pendings/range/001.cr' # :pending:
# x..y  # an inclusive range, in mathematics: [x, y]
# x...y # an exclusive range, in mathematics: [x, y)

puts "# range.cr:17 (002.cr)" # :nocode: :example:
# Represents a string of 'x's.
struct Xs
  include Comparable(Xs)

  getter size

  def initialize(@size : Int32)
  end

  def succ
    Xs.new(@size + 1)
  end

  def <=>(other)
    @size <=> other.size
  end

  def inspect(io)
    @size.times { io << 'x' }
  end

  def to_s(io)
    io << @size << ' '
    inspect(io)
  end
end

puts "# range.cr:48 (003.cr)" # :nocode: :example:
r = Xs.new(3)..Xs.new(6)
( r.to_s ).to_s.should eq( "xxx..xxxxxx" )
( r.to_a ).should eq( [Xs.new(3), Xs.new(4), Xs.new(5), Xs.new(6)] )
( r.includes?(Xs.new(5)) ).should eq( true )

puts "# range.cr:60 (004.cr)" # :nocode: :example:
( (1..10).begin ).should eq( 1 )
( (1...10).begin ).should eq( 1 )

puts "# range.cr:68 (005.cr)" # :nocode: :example:
( (1..10).end ).should eq( 10 )
( (1...10).end ).should eq( 10 )

puts "# range.cr:80 (006.cr)" # :nocode: :example:
( Range.new(1, 10) ).should eq( 1..10 )
( Range.new(1, 10, exclusive: true) ).should eq( 1...10 )

puts "# range.cr:89 (007.cr)" # :nocode: :example:
( (1..3).cycle.first(5).to_a ).should eq( [1, 2, 3, 1, 2] )

puts "# range.cr:98 (008.cr)" # :nocode: :example:
(10..15).each { |n| print n, ' ' }
# prints: 10 11 12 13 14 15

puts "# range.cr:113 (009.cr)" # :nocode: :example:
( (1..3).each.skip(1).to_a ).should eq( [2, 3] )

puts "# range.cr:123 (010.cr)" # :nocode: :example:
(10...15).reverse_each { |n| print n, ' ' }
# prints: 14 13 12 11 10

puts "# range.cr:138 (011.cr)" # :nocode: :example:
( (1..3).reverse_each.skip(1).to_a ).should eq( [2, 1] )

puts "# range.cr:147 (012.cr)" # :nocode: :example:
range = Xs.new(1)..Xs.new(10)
range.step(2) { |x| puts x }
puts
range.step(3) { |x| puts x }

puts "# range.cr:182 (013.cr)" # :nocode: :example:
( (1..10).step(3).skip(1).to_a ).should eq( [4, 7, 10] )

puts "# range.cr:191 (014.cr)" # :nocode: :example:
( (1..10).excludes_end? ).should eq( false )
( (1...10).excludes_end? ).should eq( true )

puts "# range.cr:201 (015.cr)" # :nocode: :example:
( (1..10).includes?(4) ).should eq( true )
( (1..10).includes?(10) ).should eq( true )
( (1..10).includes?(11) ).should eq( false )

( (1...10).includes?(9) ).should eq( true )
( (1...10).includes?(10) ).should eq( false )

puts "# range.cr:224 (016.cr)" # :nocode: :example:
case 79
when 1..50   then puts "low"
when 51..75  then puts "medium"
when 76..100 then puts "high"
end

