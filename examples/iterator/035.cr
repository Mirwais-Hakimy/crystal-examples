# iterator.cr:1288
[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunk(&.even?).each do |even, ary|
  p [even, ary]
end

# => [false, [3, 1]]
#    [true, [4]]
#    [false, [1, 5, 9]]
#    [true, [2, 6]]
#    [false, [5, 3, 5]]
