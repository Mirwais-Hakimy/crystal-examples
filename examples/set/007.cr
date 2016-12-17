# set.cr:101
s = Set{1, 5}
s.includes? 5 # => true
s.delete 5
s.includes? 5 # => false
