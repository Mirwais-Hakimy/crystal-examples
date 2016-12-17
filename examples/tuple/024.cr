# tuple.cr:445
tuple = {1, "hello", 'x'}
tuple.reverse_each do |value|
  puts value
end
