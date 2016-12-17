# pointer.cr:86
ptr = Pointer(Int32).new(1234)
ptr.address # => 1234

# An Int32 occupies four bytes
ptr2 = ptr - 1
ptr2.address # => 1230
