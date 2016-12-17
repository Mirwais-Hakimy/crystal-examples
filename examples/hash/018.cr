# hash.cr:298
h = {"foo" => "bar"}
h.delete("foo")     # => "bar"
h.fetch("foo", nil) # => nil
