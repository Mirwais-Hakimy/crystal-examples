# array.cr:365
a = [1, 2, 3, 4, 5]
a[1..3] = 6
a # => [1, 6, 5]

a = [1, 2, 3, 4, 5]
a[1...1] = 6
a # => [1, 6, 2, 3, 4, 5]
