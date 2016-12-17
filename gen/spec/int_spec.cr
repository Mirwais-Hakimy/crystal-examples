require "spec"

it "int.cr" do
puts # :nocode:

puts "# int.cr:12 (001.cr)" # :nocode: :example:
1 # Int32

1_i8  # Int8
1_i16 # Int16
1_i32 # Int32
1_i64 # Int64

1_u8  # UInt8
1_u16 # UInt16
1_u32 # UInt32
1_u64 # UInt64

+10 # Int32
-20 # Int32

2147483648          # Int64
9223372036854775808 # UInt64

puts "# int.cr:36 (002.cr)" # :nocode: :example:
1_000_000 # better than 1000000

puts "# int.cr:42 (003.cr)" # :nocode: :example:
0b1101 # == 13

puts "# int.cr:48 (004.cr)" # :nocode: :example:
0o123 # == 83

puts "# int.cr:54 (005.cr)" # :nocode: :example:
0xFE012D # == 16646445
0xfe012d # == 16646445

puts "# int.cr:67 (006.cr)" # :nocode: :example:
( 97.chr ).should eq( 'a' )

puts "# int.cr:199 (007.cr)" # :nocode: :example:
( 8000 >> 1 ).should eq( 4000 )
( 8000 >> 2 ).should eq( 2000 )
( 8000 >> 32 ).should eq( 0 )
( 8000 >> -1 ).should eq( 16000 )

( -8000 >> 1 ).should eq( -4000 )

puts "# int.cr:222 (008.cr)" # :nocode: :example:
( 8000 << 1 ).should eq( 16000 )
( 8000 << 2 ).should eq( 32000 )
( 8000 << 32 ).should eq( 0 )
( 8000 << -1 ).should eq( 4000 )

puts "# int.cr:263 (009.cr)" # :nocode: :example:
( 2 ** 3 ).should eq( 8 )
( 2 ** 0 ).should eq( 1 )
# 2 ** -1 # ArgumentError

puts "# int.cr:288 (010.cr)" # :nocode: :example:
( 2 &** 3 ).should eq( 8 )
( 2 &** 0 ).should eq( 1 )
# 2 &** -1 # ArgumentError

puts "# int.cr:310 (011.cr)" # :nocode: :example:
( 2 ** 3.0 ).try(&.to_f).to_s.should eq( "8.0" )
( 2 ** 0.0 ).try(&.to_f).to_s.should eq( "1.0" )
( 2 ** -1.0 ).try(&.to_f).to_s.should eq( "0.5" )

puts "# int.cr:325 (012.cr)" # :nocode: :example:
( 11.bit(0) ).should eq( 1 )
( 11.bit(1) ).should eq( 1 )
( 11.bit(2) ).should eq( 0 )
( 11.bit(3) ).should eq( 1 )
( 11.bit(4) ).should eq( 0 )

puts "# int.cr:338 (013.cr)" # :nocode: :example:
( 0b0110.bits_set?(0b0110) ).should eq( true )
( 0b1101.bits_set?(0b0111) ).should eq( false )
( 0b1101.bits_set?(0b1100) ).should eq( true )

puts "# int.cr:546 (014.cr)" # :nocode: :example:
( 5.popcount ).should eq( 2 )
( -15.popcount ).should eq( 29 )


end
