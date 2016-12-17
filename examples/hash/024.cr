# hash.cr:424
h = {"foo" => "bar"}
h.each_key do |key|
  key # => "foo"
end
