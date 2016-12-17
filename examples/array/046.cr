# array.cr:880
a = [1, 2, 3]
a.map! { |x| x * x }
a # => [1, 4, 9]
