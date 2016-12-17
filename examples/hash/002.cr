# hash.cr:46
hash = Hash(String, Int32).new do |hash, key|
  hash[key] = key.size
end

hash.size   # => 0
hash["foo"] # => 3
hash.size   # => 1
hash["bar"] = 10
hash["bar"] # => 10
