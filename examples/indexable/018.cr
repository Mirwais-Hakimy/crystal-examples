# indexable.cr:423
a = [1, 2, 3]
b = ["a", "ab", "abc"]
a.equals?(b) { |x, y| x == y.size } # => true
a.equals?(b) { |x, y| x == y }      # => false
