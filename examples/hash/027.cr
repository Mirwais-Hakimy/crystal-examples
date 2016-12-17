# hash.cr:470
hsh = {"foo" => "bar", "baz" => "qux"}
iterator = hsh.each_value

value = iterator.next
value # => "bar"

value = iterator.next
value # => "qux"
