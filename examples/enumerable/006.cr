# enumerable.cr:89
[2, 3, 4].any?(1..3)      # => true
[2, 3, 4].any?(5..10)     # => false
[2, "a", 3].any?(String)  # => true
%w[foo bar baz].any?(/a/) # => true
