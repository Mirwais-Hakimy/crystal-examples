# string.cr:621
"123.45e1".to_f                # => 1234.5
# "45.67 degrees".to_f           # raises ArgumentError
# "thx1138".to_f(strict: false)  # raises ArgumentError
# " 1.2".to_f(whitespace: false) # raises ArgumentError
"1.2foo".to_f(strict: false)   # => 1.2
