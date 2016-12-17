# string.cr:295
"12345".to_i             # => 12345
# "0a".to_i                # raises ArgumentError
# "hello".to_i             # raises ArgumentError
"0a".to_i(16)            # => 10
"1100101".to_i(2)        # => 101
"1100101".to_i(8)        # => 294977
"1100101".to_i(10)       # => 1100101
"1100101".to_i(base: 16) # => 17826049

# "12_345".to_i                   # raises ArgumentError
"12_345".to_i(underscore: true) # => 12345

"  12345  ".to_i                    # => 12345
# "  12345  ".to_i(whitespace: false) # raises ArgumentError

# "0x123abc".to_i               # raises ArgumentError
"0x123abc".to_i(prefix: true) # => 1194684

# "99 red balloons".to_i                # raises ArgumentError
"99 red balloons".to_i(strict: false) # => 99
