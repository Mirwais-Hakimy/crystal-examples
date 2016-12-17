# hash.cr:749
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.first_key? # => "foo1"
hash.clear
hash.first_key? # => nil
