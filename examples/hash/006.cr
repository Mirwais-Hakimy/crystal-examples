# hash.cr:121
h = {"foo" => "bar"}
h["foo"] # => "bar"

h = Hash(String, String).new("bar")
h["foo"] # => "bar"

h = Hash(String, String).new { "bar" }
h["foo"] # => "bar"

h = Hash(String, String).new
# h["foo"] # raises KeyError
