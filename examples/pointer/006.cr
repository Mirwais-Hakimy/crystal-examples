# pointer.cr:124
ptr = Pointer(Int32).malloc(4) # [0, 0, 0, 0]
ptr[1] = 42

ptr2 = ptr + 1
ptr2.value # => 42
