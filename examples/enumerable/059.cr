# enumerable.cr:1200
[1, 2, 3, 4, 5, 0].skip_while { |i| i < 3 } # => [3, 4, 5, 0]
