# hash.cr:650
h = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}.select!("a", "c")
h # => {"a" => 1, "c" => 3}
