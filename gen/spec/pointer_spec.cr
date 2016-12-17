require "spec"

it "pointer.cr" do
puts # :nocode:

puts "# pointer.cr:17 (001.cr)" # :nocode: :example:
x = 1
ptr = pointerof(x)
ptr.value = 2
( x ).should eq( 2 )

puts "# pointer.cr:59 (002.cr)" # :nocode: :example:
a = 1
( pointerof(a).null? ).should eq( false )

b = Pointer(Int32).new(0)
( b.null? ).should eq( true )

puts "# pointer.cr:72 (003.cr)" # :nocode: :example:
ptr = Pointer(Int32).new(1234)
( ptr.address ).should eq( 1234 )

# An Int32 occupies four bytes
ptr2 = ptr + 1
( ptr2.address ).should eq( 1238 )

puts "# pointer.cr:86 (004.cr)" # :nocode: :example:
ptr = Pointer(Int32).new(1234)
( ptr.address ).should eq( 1234 )

# An Int32 occupies four bytes
ptr2 = ptr - 1
( ptr2.address ).should eq( 1230 )

puts "# pointer.cr:111 (005.cr)" # :nocode: :example:
ptr = Pointer.malloc(4) { |i| i + 10 }
( ptr[0] ).should eq( 10 )
( ptr[1] ).should eq( 11 )
( ptr[2] ).should eq( 12 )
( ptr[3] ).should eq( 13 )

puts "# pointer.cr:124 (006.cr)" # :nocode: :example:
ptr = Pointer(Int32).malloc(4) # [0, 0, 0, 0]
ptr[1] = 42

ptr2 = ptr + 1
( ptr2.value ).should eq( 42 )

puts "# pointer.cr:139 (007.cr)" # :nocode: :example:
ptr1 = Pointer.malloc(4) { |i| i + 1 }  # [1, 2, 3, 4]
ptr2 = Pointer.malloc(4) { |i| i + 11 } # [11, 12, 13, 14]

# ptr2 -> [11, 12, 13, 14]
#          ^---^           <- copy this
# ptr1 -> [1,  2,  3,  4]
#          ^---^           <- here
ptr1.copy_from(ptr2, 2)
( ptr1[0] ).should eq( 11 )
( ptr1[1] ).should eq( 12 )
( ptr1[2] ).should eq( 3 )
( ptr1[3] ).should eq( 4 )

puts "# pointer.cr:170 (008.cr)" # :nocode: :example:
ptr1 = Pointer.malloc(4) { |i| i + 1 }  # [1, 2, 3, 4]
ptr2 = Pointer.malloc(4) { |i| i + 11 } # [11, 12, 13, 14]

# ptr1 -> [1,  2,  3,  4]
#          ^---^           <- copy this
# ptr2 -> [11, 12, 13, 14]
#          ^---^           <- here
ptr1.copy_to(ptr2, 2)
( ptr2[0] ).should eq( 1 )
( ptr2[1] ).should eq( 2 )
( ptr2[2] ).should eq( 13 )
( ptr2[3] ).should eq( 14 )

puts "# pointer.cr:191 (009.cr)" # :nocode: :example:
ptr1 = Pointer.malloc(4) { |i| i + 1 } # ptr1 -> [1, 2, 3, 4]
ptr2 = ptr1 + 1                        #             ^--------- ptr2

# [1, 2, 3, 4]
#  ^-----^       <- copy this
#     ^------^   <- here
ptr2.move_from(ptr1, 3)

( ptr1[0] ).should eq( 1 )
( ptr1[1] ).should eq( 1 )
( ptr1[2] ).should eq( 2 )
( ptr1[3] ).should eq( 3 )

puts "# pointer.cr:221 (010.cr)" # :nocode: :example:
ptr1 = Pointer.malloc(4) { |i| i + 1 } # ptr1 -> [1, 2, 3, 4]
ptr2 = ptr1 + 1                        #             ^--------- ptr2

# [1, 2, 3, 4]
#  ^-----^       <- copy this
#     ^------^   <- here
ptr1.move_to(ptr2, 3)

( ptr1[0] ).should eq( 1 )
( ptr1[1] ).should eq( 1 )
( ptr1[2] ).should eq( 2 )
( ptr1[3] ).should eq( 3 )

puts "# pointer.cr:279 (011.cr)" # :nocode: :example:
ptr1 = Pointer.malloc(4) { |i| i + 1 }  # [1, 2, 3, 4]
ptr2 = Pointer.malloc(4) { |i| i + 11 } # [11, 12, 13, 14]

( ptr1.memcmp(ptr2, 4) ).should eq( -10 )
( ptr2.memcmp(ptr1, 4) ).should eq( 10 )
( ptr1.memcmp(ptr1, 4) ).should eq( 0 )

puts "# pointer.cr:293 (012.cr)" # :nocode: :example:
ptr = Pointer.malloc(4) { |i| i + 1 }
( ptr[2] ).should eq( 3 )
( ptr[3] ).should eq( 4 )
ptr.swap(2, 3)
( ptr[2] ).should eq( 4 )
( ptr[3] ).should eq( 3 )

puts "# pointer.cr:307 (013.cr)" # :nocode: :example:
ptr = Pointer(Int32).new(1234)
ptr.hash # => 1234

puts "# pointer.cr:316 (014.cr)" # :nocode: :example:
ptr1 = Pointer(Int32).new(1234)
( ptr1.to_s ).to_s.should eq( "Pointer(Int32)@0x4d2" )

ptr2 = Pointer(Int32).new(0)
( ptr2.to_s ).to_s.should eq( "Pointer(Int32).null" )

puts "# pointer.cr:345 (015.cr)" # :nocode: :example:
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr = ptr.realloc(8)
ptr # [1, 2, 3, 4, 0, 0, 0, 0]

puts "# pointer.cr:360 (016.cr)" # :nocode: :example:
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr.shuffle!(4)
ptr # [3, 4, 1, 2]

puts "# pointer.cr:376 (017.cr)" # :nocode: :example:
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr.map!(4) { |value| value * 2 }
ptr # [2, 4, 6, 8]

puts "# pointer.cr:400 (018.cr)" # :nocode: :example:
ptr = Pointer(Int32).null
( ptr.address ).should eq( 0 )

puts "# pointer.cr:410 (019.cr)" # :nocode: :example:
ptr = Pointer(Int32).new(5678)
( ptr.address ).should eq( 5678 )

puts "# pointer.cr:423 (020.cr)" # :nocode: :example:
# Allocate memory for an Int32: 4 bytes
ptr = Pointer(Int32).malloc
( ptr.value ).should eq( 0 )

# Allocate memory for 10 Int32: 40 bytes
ptr = Pointer(Int32).malloc(10)
( ptr[0] ).should eq( 0 )
# ...
( ptr[9] ).should eq( 0 )

puts "# pointer.cr:447 (021.cr)" # :nocode: :example:
# An Int32 occupies 4 bytes, so here we are requesting 8 bytes
# initialized to the number 42
ptr = Pointer.malloc(2, 42)
( ptr[0] ).should eq( 42 )
( ptr[1] ).should eq( 42 )

puts "# pointer.cr:466 (022.cr)" # :nocode: :example:
# An Int32 occupies 4 bytes, so here we are requesting 16 bytes.
# i is an index in the range 0 .. 3
ptr = Pointer.malloc(4) { |i| i + 10 }
( ptr[0] ).should eq( 10 )
( ptr[1] ).should eq( 11 )
( ptr[2] ).should eq( 12 )
( ptr[3] ).should eq( 13 )

puts "# pointer.cr:488 (023.cr)" # :nocode: :example:
ptr = Pointer.malloc(6) { |i| i + 10 } # [10, 11, 12, 13, 14, 15]
( slice = ptr.to_slice(4) ).should eq( Slice[10, 11, 12, 13] )
( slice.class ).should eq( Slice(Int32) )

puts "# pointer.cr:499 (024.cr)" # :nocode: :example:
ptr = Pointer.malloc(6) { |i| i + 10 } # [10, 11, 12, 13, 14, 15]
ptr.clear(3)
( ptr.to_slice(6) ).should eq( Slice[0, 0, 0, 13, 14, 15] )


end
