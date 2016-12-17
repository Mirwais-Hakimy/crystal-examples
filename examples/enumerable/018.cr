# enumerable.cr:461
array = ["Alice", "Bob"].flat_map do |user|
  user.chars
end
array # => ['A', 'l', 'i', 'c', 'e', 'B', 'o', 'b']
