# array.cr:1616
a = [3, 1, 2]
b = a.sort { |a, b| b <=> a }

b # => [3, 2, 1]
a # => [3, 1, 2]
