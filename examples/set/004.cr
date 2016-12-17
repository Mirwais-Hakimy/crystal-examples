# set.cr:63
s = Set{1, 5}
s.includes? 8 # => false
s << 8
s.includes? 8 # => true
