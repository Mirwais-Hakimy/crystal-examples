# enumerable.cr:873
["Alice", "Bob"].min_of { |name| name.size } # => 3 (Bob's size)
