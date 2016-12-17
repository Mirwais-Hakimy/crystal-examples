# pointer.cr:345
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr = ptr.realloc(8)
ptr # [1, 2, 3, 4, 0, 0, 0, 0]
