# pointer.cr:293
ptr = Pointer.malloc(4) { |i| i + 1 }
ptr[2] # => 3
ptr[3] # => 4
ptr.swap(2, 3)
ptr[2] # => 4
ptr[3] # => 3
