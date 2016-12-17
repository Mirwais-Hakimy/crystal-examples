# set.cr:405
Set{1, 3, 5}.proper_superset? Set{1, 5}    # => true
Set{1, 3, 5}.proper_superset? Set{1, 3, 5} # => false
