# enumerable.cr:513
[1, 2, 3].in_groups_of(2, 0) # => [[1, 2], [3, 0]]
[1, 2, 3].in_groups_of(2)    # => [[1, 2], [3, nil]]
