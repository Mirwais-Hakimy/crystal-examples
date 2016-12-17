# complex.cr:147
require "complex"
Complex.new(42, 2).conj  # => 42.0 - 2.0i
Complex.new(42, -2).conj # => 42.0 + 2.0i
