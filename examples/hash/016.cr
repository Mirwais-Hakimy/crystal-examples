# hash.cr:272
hash = {"foo" => "bar", "baz" => "qux"}
hash.key_for?("bar")    # => "foo"
hash.key_for?("qux")    # => "baz"
hash.key_for?("foobar") # => nil
