require "spec"
require "string/utf16"
it "string/utf16.cr" do
puts # :nocode:

puts "# string/utf16.cr:11 (001.cr)" # :nocode: :example:
( "hi 𐂥".to_utf16 ).should eq( Slice[104_u16, 105_u16, 32_u16, 55296_u16, 56485_u16] )

puts "# string/utf16.cr:52 (002.cr)" # :nocode: :example:
slice = Slice[104_u16, 105_u16, 32_u16, 55296_u16, 56485_u16]
( String.from_utf16(slice) ).to_s.should eq( "hi 𐂥" )

puts "# string/utf16.cr:79 (003.cr)" # :nocode: :example:
slice = Slice[104_u16, 105_u16, 0_u16, 55296_u16, 56485_u16, 0_u16]
( String.from_utf16(slice) ).to_s.should eq( "hi\0000𐂥" )
pointer = slice.to_unsafe
( string, pointer = String.from_utf16(pointer) ).to_s.should eq( "hi" )
( string, pointer = String.from_utf16(pointer) ).to_s.should eq( "𐂥" )


end
