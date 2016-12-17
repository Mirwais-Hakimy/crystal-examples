# indexable.cr:490
[1, 2, 3, 1, 2, 3].index(offset: 2) { |x| x < 2 } # => 3
