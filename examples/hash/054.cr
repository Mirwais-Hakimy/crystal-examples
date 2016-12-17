# hash.cr:921
hash_a = {"foobar" => {"foo" => "bar"}}
hash_b = hash_a.clone
hash_b["foobar"]["foo"] = "baz"
hash_a # => {"foobar" => {"foo" => "bar"}}
