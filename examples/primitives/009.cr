# primitives.cr:180
ptr = Pointer(Int32).malloc(4)
ptr.value = 42
ptr.value # => 42
