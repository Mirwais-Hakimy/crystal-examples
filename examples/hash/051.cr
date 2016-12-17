# hash.cr:842
hash = {"foo" => "bar", "baz" => "qux"}
hash.shift { true } # => {"foo", "bar"}
hash                # => {"baz" => "qux"}

hash = {} of String => String
hash.shift { true } # => true
hash                # => {}
