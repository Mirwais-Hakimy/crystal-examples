# enumerable.cr:529
[1, 2, 4].in_groups_of(2, 0) { |e| p e.sum }
# => 3
# => 4
