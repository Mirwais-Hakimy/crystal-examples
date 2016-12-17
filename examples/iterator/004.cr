# iterator.cr:41
class Zeros
  include Iterator(Int32)

  def initialize(@size : Int32)
    @produced = 0
  end

  def next
    if @produced < @size
      @produced += 1
      0
    else
      stop
    end
  end

  def rewind
    @produced = 0
    self
  end
end

zeros = Zeros.new(5)
zeros.to_a # => [0, 0, 0, 0, 0]

zeros.rewind
zeros.first(3).to_a # => [0, 0, 0]
