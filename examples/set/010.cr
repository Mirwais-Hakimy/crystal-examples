# set.cr:137
s = Set(Int32).new
s.empty? # => true
s << 3
s.empty? # => false
