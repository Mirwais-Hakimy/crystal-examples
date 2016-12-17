# pointer.cr:139
ptr1 = Pointer.malloc(4) { |i| i + 1 }  # [1, 2, 3, 4]
ptr2 = Pointer.malloc(4) { |i| i + 11 } # [11, 12, 13, 14]

# ptr2 -> [11, 12, 13, 14]
#          ^---^           <- copy this
# ptr1 -> [1,  2,  3,  4]
#          ^---^           <- here
ptr1.copy_from(ptr2, 2)
ptr1[0] # => 11
ptr1[1] # => 12
ptr1[2] # => 3
ptr1[3] # => 4
