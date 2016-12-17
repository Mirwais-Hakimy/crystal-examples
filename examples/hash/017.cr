# hash.cr:284
hash = {"foo" => "bar"}
hash.key_for("bar") { |value| value.upcase } # => "foo"
hash.key_for("qux") { |value| value.upcase } # => "QUX"
