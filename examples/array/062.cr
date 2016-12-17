# array.cr:1479
a = [1, 2, 3]
a.sample(2)                # => [2, 1]
a.sample(2, Random.new(1)) # => [1, 3]
