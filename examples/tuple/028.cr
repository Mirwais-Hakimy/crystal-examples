# tuple.cr:511
tuple = {1, 2.5}
tuple.last? # => 2.5

empty = Tuple.new
empty.last? # => nil
