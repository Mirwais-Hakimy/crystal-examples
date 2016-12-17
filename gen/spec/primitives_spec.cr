require "spec"

it "primitives.cr" do
puts # :nocode:

puts "# primitives.cr:12 (001.cr)" # :nocode: :example:
( 1.class ).should eq( Int32 )
( "hello".class ).should eq( String )

puts "# primitives.cr:19 (002.cr)" # :nocode: :example:
# pending by 'file:pendings/primitives/002.cr' # :pending:
# random_value = rand # => 0.627423
# value = random_value < 0.5 ? 1 : "hello"
# value         # => "hello"
# value.class   # => String
# typeof(value) # => Int32 | String

puts "# primitives.cr:41 (003.cr)" # :nocode: :example:
string = "hello"
string.object_id # => 4460249568

pointer = Pointer(String).new(string.object_id)
string2 = pointer.as(String)
string2.object_id == string.object_id # => true

puts "# primitives.cr:83 (004.cr)" # :nocode: :example:
( 'a'.ord ).should eq( 97 )
( '\0'.ord ).should eq( 0 )
( '\u007f'.ord ).should eq( 127 )
( '☃'.ord ).should eq( 9731 )

puts "# primitives.cr:126 (005.cr)" # :nocode: :example:
( :foo.to_s ).to_s.should eq( "foo" )
( :"hello world".to_s ).to_s.should eq( "hello world" )

puts "# primitives.cr:141 (006.cr)" # :nocode: :example:
# Allocate memory for an Int32: 4 bytes
ptr = Pointer(Int32).malloc(1_u64)
( ptr.value ).should eq( 0 )

# Allocate memory for 10 Int32: 40 bytes
ptr = Pointer(Int32).malloc(10_u64)
( ptr[0] ).should eq( 0 )
# ...
( ptr[9] ).should eq( 0 )

puts "# primitives.cr:159 (007.cr)" # :nocode: :example:
ptr = Pointer(Int32).new(5678_u64)
( ptr.address ).should eq( 5678 )

puts "# primitives.cr:169 (008.cr)" # :nocode: :example:
ptr = Pointer(Int32).malloc(4)
ptr.value = 42
( ptr.value ).should eq( 42 )

puts "# primitives.cr:180 (009.cr)" # :nocode: :example:
ptr = Pointer(Int32).malloc(4)
ptr.value = 42
( ptr.value ).should eq( 42 )

puts "# primitives.cr:191 (010.cr)" # :nocode: :example:
ptr = Pointer(Int32).new(1234)
( ptr.address ).should eq( 1234 )

puts "# primitives.cr:209 (011.cr)" # :nocode: :example:
ptr = Pointer.malloc(4) { |i| i + 1 } # [1, 2, 3, 4]
ptr = ptr.realloc(8_u8)
ptr # [1, 2, 3, 4, 0, 0, 0, 0]

puts "# primitives.cr:221 (012.cr)" # :nocode: :example:
ptr = Pointer(Int32).new(1234)
( ptr.address ).should eq( 1234 )

# An Int32 occupies four bytes
ptr2 = ptr + 1_u64
( ptr2.address ).should eq( 1238 )

puts "# primitives.cr:236 (013.cr)" # :nocode: :example:
ptr1 = Pointer(Int32).malloc(4)
ptr2 = ptr1 + 2
( ptr2 - ptr1 ).should eq( 2 )

puts "# primitives.cr:249 (014.cr)" # :nocode: :example:
add = ->(x : Int32, y : Int32) { x + y }
( add.call(1, 2) ).should eq( 3 )

puts "# primitives.cr:325 (015.cr)" # :nocode: :example:
( 97.unsafe_chr ).should eq( 'a' )


end
