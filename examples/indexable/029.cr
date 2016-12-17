# indexable.cr:587
a = [1, 2, 3]
a.sample                # => 2
a.sample                # => 1
a.sample(Random.new(1)) # => 3
