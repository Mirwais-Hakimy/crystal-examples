# range.cr: 16 examples

# range.cr:5 (001.cr)
# pending by 'file:pendings/range/001.cr'
# x..y  # an inclusive range, in mathematics: [x, y]
# x...y # an exclusive range, in mathematics: [x, y)

# range.cr:17 (002.cr)
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

# range.cr:48 (003.cr)
r = Xs.new(3)..Xs.new(6)
r.to_s                 # => "xxx..xxxxxx"
r.to_a                 # => [Xs.new(3), Xs.new(4), Xs.new(5), Xs.new(6)]
r.includes?(Xs.new(5)) # => true

# range.cr:60 (004.cr)
(1..10).begin  # => 1
(1...10).begin # => 1

# range.cr:68 (005.cr)
(1..10).end  # => 10
(1...10).end # => 10

# range.cr:80 (006.cr)
Range.new(1, 10)                  # => 1..10
Range.new(1, 10, exclusive: true) # => 1...10

# range.cr:89 (007.cr)
(1..3).cycle.first(5).to_a # => [1, 2, 3, 1, 2]

# range.cr:98 (008.cr)
(10..15).each { |n| print n, ' ' }
# prints: 10 11 12 13 14 15

# range.cr:113 (009.cr)
(1..3).each.skip(1).to_a # => [2, 3]

# range.cr:123 (010.cr)
(10...15).reverse_each { |n| print n, ' ' }
# prints: 14 13 12 11 10

# range.cr:138 (011.cr)
(1..3).reverse_each.skip(1).to_a # => [2, 1]

# range.cr:147 (012.cr)
range = Xs.new(1)..Xs.new(10)
range.step(2) { |x| puts x }
puts
range.step(3) { |x| puts x }

# range.cr:182 (013.cr)
(1..10).step(3).skip(1).to_a # => [4, 7, 10]

# range.cr:191 (014.cr)
(1..10).excludes_end?  # => false
(1...10).excludes_end? # => true

# range.cr:201 (015.cr)
(1..10).includes?(4)  # => true
(1..10).includes?(10) # => true
(1..10).includes?(11) # => false

(1...10).includes?(9)  # => true
(1...10).includes?(10) # => false

# range.cr:224 (016.cr)
case 79
when 1..50   then puts "low"
when 51..75  then puts "medium"
when 76..100 then puts "high"
end
