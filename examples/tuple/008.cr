# tuple.cr:132
tuple = {1, "hello", 'x'}
tuple[0] # => 1 (Int32)
# tuple[3] # compile error: index out of bounds for tuple {Int32, String, Char}

i = 0
tuple[i] # => 1 (Int32 | String | Char)

i = 3
# tuple[i] # raises IndexError
