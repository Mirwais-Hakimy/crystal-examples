# char.cr:541
'1'.to_i     # => 1
'8'.to_i     # => 8
# 'c'.to_i     # raises ArgumentError
'1'.to_i(16) # => 1
'a'.to_i(16) # => 10
'f'.to_i(16) # => 15
# 'z'.to_i(16) # raises ArgumentError
