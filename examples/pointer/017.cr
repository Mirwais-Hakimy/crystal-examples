# pointer.cr:376
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr.map!(4) { |value| value * 2 }
ptr # [2, 4, 6, 8]
