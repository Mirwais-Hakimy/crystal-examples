# hash.cr:800
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.last_value? # => "baz2"
hash.clear
hash.last_value? # => nil
