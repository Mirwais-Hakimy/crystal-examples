# enumerable.cr:1109
ints = [1, true, 3, false].reject(Bool)
ints         # => [1, 3]
typeof(ints) # => Array(Int32)
