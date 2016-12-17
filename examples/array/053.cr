# array.cr:1029
a = [1, 2, 3]
sums = [] of Int32
a.each_permutation(2) { |p| sums << p.sum } # => nil
sums                                        # => [3, 4, 3, 5, 4, 5]
