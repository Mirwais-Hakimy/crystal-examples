# array.cr:921
ary = [1, 6, 2, 4, 8]
ary.reject! { |x| x > 3 }
ary # => [1, 2]
