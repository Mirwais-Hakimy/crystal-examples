# proc.cr:112
add = ->(x : Int32, y : Int32) { x + y }
add.call(1, 2) # => 3

add_one = add.partial(1)
add_one.call(2)  # => 3
add_one.call(10) # => 11

add_one_and_two = add_one.partial(2)
add_one_and_two.call # => 3
