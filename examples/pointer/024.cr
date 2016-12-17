# pointer.cr:499
ptr = Pointer.malloc(6) { |i| i + 10 } # [10, 11, 12, 13, 14, 15]
ptr.clear(3)
ptr.to_slice(6) # => Slice[0, 0, 0, 13, 14, 15]
