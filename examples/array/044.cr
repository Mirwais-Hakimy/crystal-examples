# array.cr:825
a = ["a", "b", "c"]
a.insert(0, "x")  # => ["x", "a", "b", "c"]
a.insert(2, "y")  # => ["x", "a", "y", "b", "c"]
a.insert(-1, "z") # => ["x", "a", "y", "b", "c", "z"]
