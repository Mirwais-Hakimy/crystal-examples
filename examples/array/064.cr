# array.cr:1544
a = ["a", "b", "c"]
a.shift # => "a"
a       # => ["b", "c"]

a = ["a", "b", "c"]
a.shift(4) # => ["a", "b", "c"]
a          # => []
