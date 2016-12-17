# hash.cr:411
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each

iterator.next # => {"foo", "bar"}
iterator.next # => {"baz", "qux"}
