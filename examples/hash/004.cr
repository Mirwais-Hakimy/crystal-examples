# hash.cr:76
arr = [1, 2, 3]
hash = Hash(String, Array(Int32)).new(arr)
hash["3"][1] = 4
arr # => [1, 4, 3]
