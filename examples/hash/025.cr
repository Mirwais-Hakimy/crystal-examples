# hash.cr:439
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each_key

key = iterator.next
key # => "foo"

key = iterator.next
key # => "baz"
