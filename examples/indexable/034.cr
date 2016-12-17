# indexable.cr:680
a = [1, 2, 3]
b = ["a", "b"]

a.zip?(b) # => [{1, "a"}, {2, "b"}, {3, nil}]
