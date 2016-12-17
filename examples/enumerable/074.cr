# enumerable.cr:1343
["Alice", "Bob"].product(2) { |name| name.size } # => 30 (2 * 5 * 3)
