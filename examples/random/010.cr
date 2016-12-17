# random.cr:294
slice = Bytes.new(4) # => [0, 0, 0, 0]
Random.new.random_bytes(slice)
slice # => [217, 118, 38, 196]
