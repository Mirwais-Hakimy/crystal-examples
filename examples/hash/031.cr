# hash.cr:526
hash = {"foo" => "bar"}
hash.merge({"baz" => "qux"})
# => {"foo" => "bar", "baz" => "qux"}
hash
# => {"foo" => "bar"}
