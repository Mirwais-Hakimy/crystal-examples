# set.cr:340
Set{1, 2, 3}.intersects? Set{4, 5} # => false
Set{1, 2, 3}.intersects? Set{3, 4} # => true
