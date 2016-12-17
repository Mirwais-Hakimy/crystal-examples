# hash.cr:388
h = {"foo" => "bar"}

h.each do |key, value|
  key   # => "foo"
  value # => "bar"
end

h.each do |key_and_value|
  key_and_value # => {"foo", "bar"}
end
