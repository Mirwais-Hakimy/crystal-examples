# enumerable.cr:1040
[1, 2, 3].one? { |i| i > 2 } # => true
[1, 2, 3].one? { |i| i > 1 } # => false
