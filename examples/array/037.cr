# array.cr:734
a = [1, 2, 3, 4, 5, 6]
a.fill(2, 2) { |i| i * i } # => [1, 2, 4, 9, 5, 6]
