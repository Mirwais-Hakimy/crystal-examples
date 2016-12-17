# set.cr:392
Set{1, 3, 5}.superset? Set{1, 5}    # => true
Set{1, 3, 5}.superset? Set{1, 3, 5} # => true
