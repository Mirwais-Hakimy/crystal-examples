# hash.cr:783
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.last_key? # => "foz2"
hash.clear
hash.last_key? # => nil
