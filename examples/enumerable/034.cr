# enumerable.cr:715
["Alice", "Bob"].map_with_index { |name, i| "User ##{i}: #{name}" }
# => ["User #0: Alice", "User #1: Bob"]
