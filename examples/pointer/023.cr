# pointer.cr:488
ptr = Pointer.malloc(6) { |i| i + 10 } # [10, 11, 12, 13, 14, 15]
slice = ptr.to_slice(4)                # => Slice[10, 11, 12, 13]
slice.class                            # => Slice(Int32)
