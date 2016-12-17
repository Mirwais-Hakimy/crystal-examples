# enumerable.cr:414
hash = ["Alice", "Bob"].each_with_object({} of String => Int32) do |user, sizes|
  sizes[user] = user.size
end
hash # => {"Alice" => 5, "Bob" => 3}
