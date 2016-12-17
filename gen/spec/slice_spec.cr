require "spec"

it "slice.cr" do
puts # :nocode:

puts "# slice.cr:20 (001.cr)" # :nocode: :example:
slice = Slice[1, 'a']
( slice[0] ).should eq( 1 )
( slice[1] ).should eq( 'a' )
( slice.class ).should eq( Slice(Char | Int32) )

puts "# slice.cr:47 (002.cr)" # :nocode: :example:
( Slice(UInt8).new(3).size ).should eq( 3 )

puts "# slice.cr:58 (003.cr)" # :nocode: :example:
ptr = Pointer.malloc(9) { |i| ('a'.ord + i).to_u8 }

slice = Slice.new(ptr, 3)
( slice.size ).should eq( 3 )
( slice ).should eq( Bytes[97, 98, 99] )

( String.new(slice) ).to_s.should eq( "abc" )

puts "# slice.cr:79 (004.cr)" # :nocode: :example:
slice = Slice(UInt8).new(3)
( slice ).should eq( Bytes[0, 0, 0] )

puts "# slice.cr:99 (005.cr)" # :nocode: :example:
slice = Slice.new(3) { |i| i + 10 }
( slice ).should eq( Slice[10, 11, 12] )

puts "# slice.cr:114 (006.cr)" # :nocode: :example:
slice = Slice.new(3, 10)
( slice ).should eq( Slice[10, 10, 10] )

puts "# slice.cr:132 (007.cr)" # :nocode: :example:
slice = Slice(UInt8).empty
( slice.size ).should eq( 0 )

puts "# slice.cr:142 (008.cr)" # :nocode: :example:
slice = Slice.new(5) { |i| i + 10 }
( slice ).should eq( Slice[10, 11, 12, 13, 14] )

slice2 = slice + 2
( slice2 ).should eq( Slice[12, 13, 14] )

puts "# slice.cr:162 (009.cr)" # :nocode: :example:
slice = Slice.new(5) { |i| i + 10 }
slice[0] = 20
slice[-1] = 30
( slice ).should eq( Slice[20, 11, 12, 13, 30] )

expect_raises(IndexError) { slice[10] = 1 }

puts "# slice.cr:187 (010.cr)" # :nocode: :example:
slice = Slice.new(5) { |i| i + 10 }
( slice ).should eq( Slice[10, 11, 12, 13, 14] )

slice2 = slice[1, 3]
( slice2 ).should eq( Slice[11, 12, 13] )

puts "# slice.cr:246 (011.cr)" # :nocode: :example:
slice = Slice[1, 2, 3]
slice.map! { |x| x * x }
( slice ).should eq( Slice[1, 4, 9] )

puts "# slice.cr:260 (012.cr)" # :nocode: :example:
# pending by 'file:pendings/slice/012.cr' # :pending:
# slice = Slice[1, 2.5, "a"]
# slice.map &.to_s # => Slice["1", "2.5", "a"]

puts "# slice.cr:296 (013.cr)" # :nocode: :example:
src = Slice['a', 'a', 'a']
dst = Slice['b', 'b', 'b', 'b', 'b']
src.copy_to dst
( dst ).should eq( Slice['a', 'a', 'a', 'b', 'b'] )
expect_raises(IndexError) { dst.copy_to src }

puts "# slice.cr:333 (014.cr)" # :nocode: :example:
src = Slice['a', 'a', 'a']
dst = Slice['b', 'b', 'b', 'b', 'b']
src.move_to dst
( dst ).should eq( Slice['a', 'a', 'a', 'b', 'b'] )
expect_raises(IndexError) { dst.move_to src }

puts "# slice.cr:364 (015.cr)" # :nocode: :example:
slice = UInt8.slice(97, 62, 63, 8, 255)
( slice.hexstring ).to_s.should eq( "613e3f08ff" )

puts "# slice.cr:396 (016.cr)" # :nocode: :example:
slice = UInt8.slice(97, 62, 63, 8, 255)
( slice.hexdump ).to_s.should eq( "00000000  61 3e 3f 08 ff                                    a>?.." )

puts "# slice.cr:506 (017.cr)" # :nocode: :example:
slice = Slice.new(3, 10)
( slice.to_unsafe[0] ).should eq( 10 )


end
