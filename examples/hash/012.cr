# hash.cr:226
h = {"foo" => "bar"}
h.fetch("foo", "foo") # => "bar"
h.fetch("bar", "foo") # => "foo"
