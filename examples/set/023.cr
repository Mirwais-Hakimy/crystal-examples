# set.cr:378
Set{1, 5}.proper_subset? Set{1, 3, 5}    # => true
Set{1, 3, 5}.proper_subset? Set{1, 3, 5} # => false
