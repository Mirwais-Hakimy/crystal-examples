# enumerable.cr:1148
ints = [1, true, nil, 3, false].select(Int32)
ints         # => [1, 3]
typeof(ints) # => Array(Int32)
