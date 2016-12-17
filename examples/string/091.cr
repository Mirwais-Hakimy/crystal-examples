# string.cr:2374
"abcdef" <=> "abcde"   # => 1
"abcdef" <=> "abcdef"  # => 0
"abcdef" <=> "abcdefg" # => -1
"abcdef" <=> "ABCDEF"  # => 1
