# hash.cr:511
h = {"foo" => "bar", "baz" => "qux"}
h.key_index("foo") # => 0
h.key_index("qux") # => nil
