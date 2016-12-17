# array.cr:1393
a = ["a", "b"]
a.push("c") # => ["a", "b", "c"]
# a.push(1)   # Errors, because the array only accepts String.

a = ["a", "b"] of (Int32 | String)
a.push("c") # => ["a", "b", "c"]
a.push(1)   # => ["a", "b", "c", 1]
