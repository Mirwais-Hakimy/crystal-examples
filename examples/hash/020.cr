# hash.cr:357
h = {"foo" => "bar", "fob" => "baz", "bar" => "qux"}
h.delete_if { |key, value| key.starts_with?("fo") }
h # => { "bar" => "qux" }
