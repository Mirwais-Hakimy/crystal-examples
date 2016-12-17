# indexable.cr:449
([1, 2, 3]).first { 4 }   # => 1
([] of Int32).first { 4 } # => 4
