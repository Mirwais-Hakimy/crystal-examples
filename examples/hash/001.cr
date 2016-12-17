# hash.cr:18
proc = ->(hash : Hash(String, Int32), key : String) { hash[key] = key.size }
hash = Hash(String, Int32).new(proc)

hash.size   # => 0
hash["foo"] # => 3
hash.size   # => 1
hash["bar"] = 10
hash["bar"] # => 10
