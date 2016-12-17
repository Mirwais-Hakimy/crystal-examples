# tuple.cr:480
tuple = {1, 2.5}
tuple.first? # => 1

empty = Tuple.new
empty.first? # => nil
