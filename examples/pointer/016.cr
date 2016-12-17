# pointer.cr:360
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr.shuffle!(4)
ptr # [3, 4, 1, 2]
