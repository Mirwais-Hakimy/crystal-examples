# enumerable.cr:1016
[2, 3, 4].none?(5..7)      # => true
[2, "a", 3].none?(String)  # => false
%w[foo bar baz].none?(/e/) # => true
