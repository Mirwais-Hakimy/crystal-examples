# indexable.cr:275
a = ["a", "b", "c"]
iter = a.each_index
iter.next # => 0
iter.next # => 1
