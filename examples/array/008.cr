# array.cr:119
Array.new(3) { |i| (i + 1) ** 2 } # => [1, 4, 9]

ary = Array.new(3) { [1] }
ary # => [[1], [1], [1]]
ary[0][0] = 2
ary # => [[2], [1], [1]]
