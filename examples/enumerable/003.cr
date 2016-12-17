# enumerable.cr:54
[2, 3, 4].all?(1..5)        # => true
[2, 3, 4].all?(Int32)       # => true
[2, "a", 3].all?(String)    # => false
%w[foo bar baz].all?(/o|a/) # => true
