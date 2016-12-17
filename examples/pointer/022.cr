# pointer.cr:466
# An Int32 occupies 4 bytes, so here we are requesting 16 bytes.
# i is an index in the range 0 .. 3
ptr = Pointer.malloc(4) { |i| i + 10 }
ptr[0] # => 10
ptr[1] # => 11
ptr[2] # => 12
ptr[3] # => 13
