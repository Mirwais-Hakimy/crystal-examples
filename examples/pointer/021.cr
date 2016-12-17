# pointer.cr:447
# An Int32 occupies 4 bytes, so here we are requesting 8 bytes
# initialized to the number 42
ptr = Pointer.malloc(2, 42)
ptr[0] # => 42
ptr[1] # => 42
