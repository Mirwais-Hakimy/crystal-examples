# enumerable.cr:563
["Alice", "Bob"].index { |name| name.size < 4 } # => 1 (Bob's index)
