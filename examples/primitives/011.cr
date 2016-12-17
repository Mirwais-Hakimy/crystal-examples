# primitives.cr:209
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr = ptr.realloc(8_u8)
ptr # [1, 2, 3, 4, 0, 0, 0, 0]
