# pointer.cr:423
# Allocate memory for an Int32: 4 bytes
ptr = Pointer(Int32).malloc
ptr.value # => 0

# Allocate memory for 10 Int32: 40 bytes
ptr = Pointer(Int32).malloc(10)
ptr[0] # => 0
# ...
ptr[9] # => 0
