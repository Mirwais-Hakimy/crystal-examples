# enumerable.cr:1056
[1, 10, 100].one?(7..14)   # => true
[2, "a", 3].one?(Int32)    # => false
%w[foo bar baz].one?(/oo/) # => true
