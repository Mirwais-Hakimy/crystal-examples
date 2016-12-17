# tuple.cr:172
tuple = {1, "hello", 'x'}
tuple.at(0) { 10 } # => 1
tuple.at(3) { 10 } # => 10
