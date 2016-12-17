# pointer.cr:191
ptr1 = Pointer.malloc(4) { |i| i + 1 } # ptr1 -> [1, 2, 3, 4]
ptr2 = ptr1 + 1                        #             ^--------- ptr2

# [1, 2, 3, 4]
#  ^-----^       <- copy this
#     ^------^   <- here
ptr2.move_from(ptr1, 3)

ptr1[0] # => 1
ptr1[1] # => 1
ptr1[2] # => 2
ptr1[3] # => 3
