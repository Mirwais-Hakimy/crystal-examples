# hash.cr:200
h = {"foo" => "bar"}
h.has_key?("foo") # => true
h.has_key?("bar") # => false
