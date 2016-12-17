# enumerable.cr:42
["ant", "bear", "cat"].all? { |word| word.size >= 3 } # => true
["ant", "bear", "cat"].all? { |word| word.size >= 4 } # => false
