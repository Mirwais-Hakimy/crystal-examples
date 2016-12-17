# string.cr:2321
"aaabbbcccddd".squeeze("b-d") # => "aaabcd"
"a       bbb".squeeze         # => "a b"
