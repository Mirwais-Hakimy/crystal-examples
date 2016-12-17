# enumerable.cr:9
class Three
  include Enumerable(Int32)

  def each
    yield 1
    yield 2
    yield 3
  end
end

three = Three.new
three.to_a                # => [1, 2, 3]
three.select &.odd?       # => [1, 3]
three.all? { |x| x < 10 } # => true
