# hash.cr:905
hash_a = {"foo" => "bar"}
hash_b = hash_a.dup
hash_b.merge!({"baz" => "qux"})
hash_a # => {"foo" => "bar"}
