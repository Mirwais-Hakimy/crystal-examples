# enumerable.cr:1082
[1, 2, 3, 4, 5, 6].partition { |i| i % 2 == 0 } # => {[2, 4, 6], [1, 3, 5]}
