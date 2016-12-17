# array.cr:1648
a = [3, 1, 2]
a.sort! { |a, b| b <=> a }
a # => [3, 2, 1]
