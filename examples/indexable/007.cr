# indexable.cr:146
[2, 5, 7, 10].bsearch { |x| x >= 4 } # => 5
[2, 5, 7, 10].bsearch { |x| x > 10 } # => nil
