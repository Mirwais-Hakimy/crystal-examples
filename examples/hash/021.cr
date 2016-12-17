# hash.cr:375
h = Hash(String, String).new
h.empty? # => true

h = {"foo" => "bar"}
h.empty? # => false
