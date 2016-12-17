# complex.cr: 8 examples
require "complex"

# complex.cr:6 (001.cr)
require "complex"

Complex.new(1, 0)   # => 1.0 + 0.0i
Complex.new(5, -12) # => 5.0 - 12.0i

1.to_c # => 1.0 + 0.0i
1.i    # => 0.0 + 1.0i

# complex.cr:86 (002.cr)
Complex.new(42, 2).to_s # => "42.0 + 2.0i"

# complex.cr:98 (003.cr)
Complex.new(42, 2).inspect # => "(42.0 + 2.0i)"

# complex.cr:110 (004.cr)
Complex.new(42, 2).abs  # => 42.04759208325728
Complex.new(-42, 2).abs # => 42.04759208325728

# complex.cr:120 (005.cr)
Complex.new(42, 2).abs2 # => 1768

# complex.cr:138 (006.cr)
Complex.new(42, 2).polar # => {42.047592083257278, 0.047583103276983396}

# complex.cr:147 (007.cr)
Complex.new(42, 2).conj  # => 42.0 - 2.0i
Complex.new(42, -2).conj # => 42.0 + 2.0i

# complex.cr:183 (008.cr)
Complex.new(4, 2).exp # => -22.720847417619233 + 49.645957334580565i
