# hash.cr:999
{"foo" => "bar"}.invert                 # => {"bar" => "foo"}
{"foo" => "bar", "baz" => "bar"}.invert # => {"bar" => "baz"}
