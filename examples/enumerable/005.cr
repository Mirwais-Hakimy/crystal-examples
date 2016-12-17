# enumerable.cr:77
["ant", "bear", "cat"].any? { |word| word.size >= 4 } # => true
["ant", "bear", "cat"].any? { |word| word.size > 4 }  # => false
