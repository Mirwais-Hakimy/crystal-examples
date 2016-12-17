# pointer.cr: 24 examples

# pointer.cr:17 (001.cr)
x = 1
ptr = pointerof(x)
ptr.value = 2
x # => 2

# pointer.cr:59 (002.cr)
a = 1
pointerof(a).null? # => false

b = Pointer(Int32).new(0)
b.null? # => true

# pointer.cr:72 (003.cr)
ptr = Pointer(Int32).new(1234)
ptr.address # => 1234

# An Int32 occupies four bytes
ptr2 = ptr + 1
ptr2.address # => 1238

# pointer.cr:86 (004.cr)
ptr = Pointer(Int32).new(1234)
ptr.address # => 1234

# An Int32 occupies four bytes
ptr2 = ptr - 1
ptr2.address # => 1230

# pointer.cr:111 (005.cr)
ptr = Pointer.malloc(4) { |i| i + 10 }
ptr[0] # => 10
ptr[1] # => 11
ptr[2] # => 12
ptr[3] # => 13

# pointer.cr:124 (006.cr)
ptr = Pointer(Int32).malloc(4) # [0, 0, 0, 0]
ptr[1] = 42

ptr2 = ptr + 1
ptr2.value # => 42

# pointer.cr:139 (007.cr)
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

# pointer.cr:170 (008.cr)
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

# pointer.cr:191 (009.cr)
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

# pointer.cr:221 (010.cr)
ptr1 = Pointer.malloc(4) { |i| i + 1 } # ptr1 -> [1, 2, 3, 4]
ptr2 = ptr1 + 1                        #             ^--------- ptr2

# [1, 2, 3, 4]
#  ^-----^       <- copy this
#     ^------^   <- here
ptr1.move_to(ptr2, 3)

ptr1[0] # => 1
ptr1[1] # => 1
ptr1[2] # => 2
ptr1[3] # => 3

# pointer.cr:279 (011.cr)
ptr1 = Pointer.malloc(4) { |i| i + 1 }  # [1, 2, 3, 4]
ptr2 = Pointer.malloc(4) { |i| i + 11 } # [11, 12, 13, 14]

ptr1.memcmp(ptr2, 4) # => -10
ptr2.memcmp(ptr1, 4) # => 10
ptr1.memcmp(ptr1, 4) # => 0

# pointer.cr:293 (012.cr)
ptr = Pointer.malloc(4) { |i| i + 1 }
ptr[2] # => 3
ptr[3] # => 4
ptr.swap(2, 3)
ptr[2] # => 4
ptr[3] # => 3

# pointer.cr:307 (013.cr)
ptr = Pointer(Int32).new(1234)
ptr.hash # => 1234

# pointer.cr:316 (014.cr)
ptr1 = Pointer(Int32).new(1234)
ptr1.to_s # => "Pointer(Int32)@0x4d2"

ptr2 = Pointer(Int32).new(0)
ptr2.to_s # => "Pointer(Int32).null"

# pointer.cr:345 (015.cr)
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr = ptr.realloc(8)
ptr # [1, 2, 3, 4, 0, 0, 0, 0]

# pointer.cr:360 (016.cr)
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr.shuffle!(4)
ptr # [3, 4, 1, 2]

# pointer.cr:376 (017.cr)
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr.map!(4) { |value| value * 2 }
ptr # [2, 4, 6, 8]

# pointer.cr:400 (018.cr)
ptr = Pointer(Int32).null
ptr.address # => 0

# pointer.cr:410 (019.cr)
ptr = Pointer(Int32).new(5678)
ptr.address # => 5678

# pointer.cr:423 (020.cr)
# Allocate memory for an Int32: 4 bytes
ptr = Pointer(Int32).malloc
ptr.value # => 0

# Allocate memory for 10 Int32: 40 bytes
ptr = Pointer(Int32).malloc(10)
ptr[0] # => 0
# ...
ptr[9] # => 0

# pointer.cr:447 (021.cr)
# An Int32 occupies 4 bytes, so here we are requesting 8 bytes
# initialized to the number 42
ptr = Pointer.malloc(2, 42)
ptr[0] # => 42
ptr[1] # => 42

# pointer.cr:466 (022.cr)
# An Int32 occupies 4 bytes, so here we are requesting 16 bytes.
# i is an index in the range 0 .. 3
ptr = Pointer.malloc(4) { |i| i + 10 }
ptr[0] # => 10
ptr[1] # => 11
ptr[2] # => 12
ptr[3] # => 13

# pointer.cr:488 (023.cr)
ptr = Pointer.malloc(6) { |i| i + 10 } # [10, 11, 12, 13, 14, 15]
slice = ptr.to_slice(4)                # => Slice[10, 11, 12, 13]
slice.class                            # => Slice(Int32)

# pointer.cr:499 (024.cr)
ptr = Pointer.malloc(6) { |i| i + 10 } # [10, 11, 12, 13, 14, 15]
ptr.clear(3)
ptr.to_slice(6) # => Slice[0, 0, 0, 13, 14, 15]
