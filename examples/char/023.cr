# char.cr:284
'l'.in_set? "lo"          # => true
'l'.in_set? "lo", "o"     # => false
'l'.in_set? "hello", "^l" # => false
'l'.in_set? "j-m"         # => true

'^'.in_set? "\\^aeiou" # => true
'-'.in_set? "a\\-eo"   # => true

'\\'.in_set? "\\"    # => true
'\\'.in_set? "\\A"   # => false
'\\'.in_set? "X-\\w" # => true
