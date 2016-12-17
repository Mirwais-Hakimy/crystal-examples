# array.cr:1799
a = ["a", "a", "b", "b", "c"]
a.uniq! # => ["a", "b", "c"]
a       # => ["a", "b", "c"]
