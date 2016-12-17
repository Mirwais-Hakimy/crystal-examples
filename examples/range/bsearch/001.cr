# range/bsearch.cr:78
require "range/bsearch"
(0..10).bsearch { |x| x >= 5 }                       # => 5
(0..Float64::INFINITY).bsearch { |x| x ** 4 >= 256 } # => 4
