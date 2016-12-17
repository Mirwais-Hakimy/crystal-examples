# enumerable.cr:116
ary = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunks { |n| n.even? }
ary # => [{false, [3, 1]}, {true, [4]}, {false, [1, 5, 9]}, {true, [2, 6]}, {false, [5, 3, 5]}]
