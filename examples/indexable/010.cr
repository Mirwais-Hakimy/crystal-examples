# indexable.cr:194
a = ["a", "b", "c"]
iter = a.each
iter.next # => "a"
iter.next # => "b"
