# hash.cr:309
h = {"foo" => "bar"}
h.delete("foo") { |key| "#{key} not found" } # => "bar"
h.fetch("foo", nil)                          # => nil
h.delete("baz") { |key| "#{key} not found" } # => "baz not found"
