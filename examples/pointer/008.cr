# pointer.cr:170
ptr1 = Pointer.malloc(4) { |i| i + 1 }  # [1, 2, 3, 4]
ptr2 = Pointer.malloc(4) { |i| i + 11 } # [11, 12, 13, 14]

# ptr1 -> [1,  2,  3,  4]
#          ^---^           <- copy this
# ptr2 -> [11, 12, 13, 14]
#          ^---^           <- here
ptr1.copy_to(ptr2, 2)
ptr2[0] # => 1
ptr2[1] # => 2
ptr2[2] # => 13
ptr2[3] # => 14
