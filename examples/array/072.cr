# array.cr:1692
a = ["first", "second", "third"]
a.swap(1, 2)  # => ["first", "third", "second"]
a             # => ["first", "third", "second"]
a.swap(0, -1) # => ["second", "third", "first"]
a             # => ["second", "third", "first"]
# a.swap(2, 3)  # => raises "Index out of bounds (IndexError)"
