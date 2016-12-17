# hash.cr:677
hash = {"hello" => "world", "foo" => nil}
hash.compact! # => {"hello" => "world"}
hash.compact! # => nil
