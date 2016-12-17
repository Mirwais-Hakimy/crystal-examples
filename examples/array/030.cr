# array.cr:602
a = ["a", "b", "b", "b", "c"]
a.delete("b") # => "b"
a             # => ["a", "c"]

a.delete("x") # => nil
a             # => ["a", "c"]
