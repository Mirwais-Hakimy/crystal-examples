# hash.cr:69
inventory = Hash(String, Int32).new(0)
inventory["socks"] = 3
inventory["pickles"] # => 0
