# range.cr:17
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
