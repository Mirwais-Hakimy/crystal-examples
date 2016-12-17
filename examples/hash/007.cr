# hash.cr:147
h = {"foo" => "bar"}
h["foo"]? # => "bar"
h["bar"]? # => nil

h = Hash(String, String).new("bar")
h["foo"]? # => nil
