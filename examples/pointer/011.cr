# pointer.cr:279
ptr1 = Pointer.malloc(4) { |i| i + 1 }  # [1, 2, 3, 4]
ptr2 = Pointer.malloc(4) { |i| i + 11 } # [11, 12, 13, 14]

ptr1.memcmp(ptr2, 4) # => -10
ptr2.memcmp(ptr1, 4) # => 10
ptr1.memcmp(ptr1, 4) # => 0
