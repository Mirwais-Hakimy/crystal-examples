# enumerable.cr:432
[1, 2, 3, 4].find { |i| i > 2 }     # => 3
[1, 2, 3, 4].find { |i| i > 8 }     # => nil
[1, 2, 3, 4].find(-1) { |i| i > 8 } # => -1
