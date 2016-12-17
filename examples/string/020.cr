# string.cr:324
"12345".to_i?             # => 12345
"99 red balloons".to_i?   # => nil
"0a".to_i?(strict: false) # => 0
"hello".to_i?             # => nil
