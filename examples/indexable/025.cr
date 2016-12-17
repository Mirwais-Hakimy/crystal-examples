# indexable.cr:517
([1, 2, 3]).last { 4 }   # => 3
([] of Int32).last { 4 } # => 4
