# primitives.cr:249
add = ->(x : Int32, y : Int32) { x + y }
add.call(1, 2) # => 3
