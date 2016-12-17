# array.cr:1846
a = ["a", "b"]
a.unshift("c") # => ["c", "a", "b"]
# a.unshift(1)   # Errors, because the array only accepts String.

a = ["a", "b"] of (Int32 | String)
a.unshift("c") # => ["c", "a", "b"]
a.unshift(1)   # => [1, "c", "a", "b"]
