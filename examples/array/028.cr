# array.cr:546
ary = ["a", nil, "b", nil, "c"]
ary.compact!
ary # => ["a", "b", "c"]
