# hash.cr:455
h = {"foo" => "bar"}
h.each_value do |value|
  value # => "bar"
end
