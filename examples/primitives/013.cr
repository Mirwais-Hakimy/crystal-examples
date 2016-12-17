# primitives.cr:236
ptr1 = Pointer(Int32).malloc(4)
ptr2 = ptr1 + 2
ptr2 - ptr1 # => 2
