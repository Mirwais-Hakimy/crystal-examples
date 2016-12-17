# primitives.cr:141
# Allocate memory for an Int32: 4 bytes
ptr = Pointer(Int32).malloc(1_u64)
ptr.value # => 0

# Allocate memory for 10 Int32: 40 bytes
ptr = Pointer(Int32).malloc(10_u64)
ptr[0] # => 0
# ...
ptr[9] # => 0
