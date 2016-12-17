# array.cr:893
ary = [1, 6, 2, 4, 8]
ary.select! { |x| x > 3 }
ary # => [6, 4, 8]
