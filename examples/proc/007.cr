# proc.cr:143
add = ->(x : Int32, y : Int32) { x + y }
add.arity # => 2

neg = ->(x : Int32) { -x }
neg.arity # => 1
