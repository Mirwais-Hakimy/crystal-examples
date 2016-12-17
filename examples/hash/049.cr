# hash.cr:813
hash = {"foo" => "bar", "baz" => "qux"}
hash.shift # => {"foo", "bar"}
hash       # => {"baz" => "qux"}

hash = {} of String => String
# hash.shift # raises IndexError
