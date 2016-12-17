# number.cr:173
1234.567.significant(1) # => 1000
1234.567.significant(2) # => 1200
1234.567.significant(3) # => 1230
1234.567.significant(4) # => 1235
1234.567.significant(5) # => 1234.6
1234.567.significant(6) # => 1234.57
1234.567.significant(7) # => 1234.567
1234.567.significant(8) # => 1234.567

15.159.significant(1, base = 2) # => 16
