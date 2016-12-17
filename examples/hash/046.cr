# hash.cr:766
hash = {"foo1" => "bar1", "foz2" => "baz2"}
hash.first_value? # => "bar1"
hash.clear
hash.first_value? # => nil
