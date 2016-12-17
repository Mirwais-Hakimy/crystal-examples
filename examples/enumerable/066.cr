# enumerable.cr:1271
["Alice", "Bob"].sum(1) { |name| name.size } # => 9 (1 + 5 + 3)
