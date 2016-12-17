# indexable.cr:165
[2, 5, 7, 10].bsearch_index { |x, i| x >= 4 } # => 1
[2, 5, 7, 10].bsearch_index { |x, i| x > 10 } # => nil
