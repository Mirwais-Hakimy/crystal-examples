# hash.cr:827
hash = {"foo" => "bar", "baz" => "qux"}
hash.shift? # => {"foo", "bar"}
hash        # => {"baz" => "qux"}

hash = {} of String => String
hash.shift? # => nil
