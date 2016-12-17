# complex.cr:6
require "complex"

Complex.new(1, 0)   # => 1.0 + 0.0i
Complex.new(5, -12) # => 5.0 - 12.0i

1.to_c # => 1.0 + 0.0i
1.i    # => 0.0 + 1.0i
