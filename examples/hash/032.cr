# hash.cr:549
hash = {"foo" => "bar"}
hash.merge!({"baz" => "qux"})
hash # => {"foo" => "bar", "baz" => "qux"}
