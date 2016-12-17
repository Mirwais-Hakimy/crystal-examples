# indexable.cr:568
[1, 2, 3, 2, 3].rindex { |x| x < 3 }            # => 3
[1, 2, 3, 2, 3].rindex(offset: 2) { |x| x < 3 } # => 1
