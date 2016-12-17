require "spec"

it "static_array.cr" do
puts # :nocode:

puts "# static_array.cr:9 (001.cr)" # :nocode: :example:
( StaticArray(Int32, 3).new(42) ).should eq( StaticArray[42, 42, 42] )
( StaticArray(Int32, 3).new { |i| i * 2 } ).should eq( StaticArray[0, 2, 4] )
( StaticArray[0, 8, 15] ).should eq( StaticArray[0, 8, 15] )

puts "# static_array.cr:18 (002.cr)" # :nocode: :example:
ints = uninitialized Int32[3]
ints[0] = 0
ints[1] = 8
ints[3] = 15

puts "# static_array.cr:28 (003.cr)" # :nocode: :example:
( Int32.static_array(0, 8, 15) ).should eq( StaticArray[0, 8, 15] )

puts "# static_array.cr:42 (004.cr)" # :nocode: :example:
ary = StaticArray[1, 'a']
( ary[0] ).should eq( 1 )
( ary[1] ).should eq( 'a' )
( ary.class ).should eq( StaticArray(Char | Int32, 2) )

puts "# static_array.cr:62 (005.cr)" # :nocode: :example:
( StaticArray(Int32, 3).new { |i| i * 2 } ).should eq( StaticArray[0, 2, 4] )

puts "# static_array.cr:75 (006.cr)" # :nocode: :example:
( StaticArray(Int32, 3).new(42) ).should eq( StaticArray[42, 42, 42] )

puts "# static_array.cr:91 (007.cr)" # :nocode: :example:
( array = StaticArray(Int32, 3).new 0 ).should eq( StaticArray[0, 0, 0] )
( array2 = StaticArray(Int32, 3).new 0 ).should eq( StaticArray[0, 0, 0] )
( array3 = StaticArray(Int32, 3).new 1 ).should eq( StaticArray[1, 1, 1] )
( array == array2 ).should eq( true )
( array == array3 ).should eq( false )

puts "# static_array.cr:108 (008.cr)" # :nocode: :example:
( array = StaticArray(Int32, 3).new 0 ).should eq( StaticArray[0, 0, 0] )
( array == nil ).should eq( false )

puts "# static_array.cr:126 (009.cr)" # :nocode: :example:
( array = StaticArray(Int32, 3).new { |i| i + 1 } ).should eq( StaticArray[1, 2, 3] )
( array[2] = 2 ).should eq( 2 )
( array ).should eq( StaticArray[1, 2, 2] )
expect_raises(IndexError) { array[4] = 4 }

puts "# static_array.cr:142 (010.cr)" # :nocode: :example:
( array = StaticArray(Int32, 3).new { |i| i + 1 } ).should eq( StaticArray[1, 2, 3] )
( array.update(1) { |x| x * 2 } ).should eq( 4 )
( array ).should eq( StaticArray[1, 4, 3] )
expect_raises(IndexError) { array.update(5) { |x| x * 2 } }

puts "# static_array.cr:155 (011.cr)" # :nocode: :example:
array = StaticArray(Int32, 3).new { |i| i + 1 }
( array.size ).should eq( 3 )

puts "# static_array.cr:165 (012.cr)" # :nocode: :example:
array = StaticArray(Int32, 3).new { |i| i + 1 }
( array.[]= 2 ).should eq( nil )
( array ).should eq( StaticArray[2, 2, 2] )

puts "# static_array.cr:179 (013.cr)" # :nocode: :example:
# pending by 'file:pendings/static_array/010.cr' # :pending:
# a = StaticArray(Int32, 3).new { |i| i + 1 } # => StaticArray[1, 2, 3]
# a.shuffle!(Random.new(42))                  # => StaticArray[3, 2, 1]
# a                                           # => StaticArray[3, 2, 1]

puts "# static_array.cr:192 (014.cr)" # :nocode: :example:
array = StaticArray(Int32, 3).new { |i| i + 1 }
( array.map! { |x| x*x } ).should eq( StaticArray[1, 4, 9] )

puts "# static_array.cr:203 (015.cr)" # :nocode: :example:
array = StaticArray[1, 2.5, "a"]
( array.map &.to_s ).should eq( StaticArray["1", "2.5", "a"] )

puts "# static_array.cr:224 (016.cr)" # :nocode: :example:
array = StaticArray(Int32, 3).new { |i| i + 1 }
( array.reverse! ).should eq( StaticArray[3, 2, 1] )

puts "# static_array.cr:236 (017.cr)" # :nocode: :example:
array = StaticArray(Int32, 3).new(2)
( slice = array.to_slice ).should eq( Slice[2, 2, 2] )
slice[0] = 3
( array ).should eq( StaticArray[3, 2, 2] )

puts "# static_array.cr:248 (018.cr)" # :nocode: :example:
ary = StaticArray(Int32, 3).new(42)
( ary.to_unsafe[0] ).should eq( 42 )

puts "# static_array.cr:258 (019.cr)" # :nocode: :example:
array = StaticArray(Int32, 3).new { |i| i + 1 }
( array.to_s ).to_s.should eq( "StaticArray[1, 2, 3]" )


end
