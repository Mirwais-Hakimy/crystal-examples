# hash.cr:237
h = {"foo" => "bar"}
h.fetch("foo") { "default value" }  # => "bar"
h.fetch("bar") { "default value" }  # => "default value"
h.fetch("bar") { |key| key.upcase } # => "BAR"
