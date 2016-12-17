# indexable.cr:99
ary = [{1, 2, 3, {4, 5, 6}}]
ary.dig?(0, 3, 2) # => 6
ary.dig?(0, 3, 3) # => nil
