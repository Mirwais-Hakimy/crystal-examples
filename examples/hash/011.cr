# hash.cr:211
h = {"foo" => "bar"}
h.has_value?("foo") # => false
h.has_value?("bar") # => true
