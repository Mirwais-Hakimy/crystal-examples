# array.cr:93
Array.new(3, 'a') # => ['a', 'a', 'a']

ary = Array.new(3, [1])
ary # => [[1], [1], [1]]
ary[0][0] = 2
ary # => [[2], [2], [2]]
