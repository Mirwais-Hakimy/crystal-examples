# primitives.cr:159
ptr = Pointer(Int32).new(5678_u64)
ptr.address # => 5678
