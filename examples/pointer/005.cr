# pointer.cr:111
ptr = Pointer.malloc(4) { |i| i + 10 }
ptr[0] # => 10
ptr[1] # => 11
ptr[2] # => 12
ptr[3] # => 13
