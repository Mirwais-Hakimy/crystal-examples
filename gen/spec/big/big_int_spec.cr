require "spec"
require "big"
it "big/big_int.cr" do
puts # :nocode:

puts "# big/big_int.cr:16 (001.cr)" # :nocode: :example:
# require "big"
( BigInt.new ).should eq( 0 )

puts "# big/big_int.cr:28 (002.cr)" # :nocode: :example:
( BigInt.new("123456789123456789123456789123456789") ).to_s.should eq( "123456789123456789123456789123456789" )
( BigInt.new("123_456_789_123_456_789_123_456_789") ).to_s.should eq( "123456789012345678901234567890" )
( BigInt.new("1234567890ABCDEF", base: 16) ).should eq( 1311768467294899695 )

puts "# big/big_int.cr:357 (003.cr)" # :nocode: :example:
( BigInt.new("123456789101101987654321").to_s ).to_s.should eq( "123456789101101987654321" )

puts "# big/big_int.cr:372 (004.cr)" # :nocode: :example:
( BigInt.new("123456789101101987654321").to_s(8) ).to_s.should eq( "32111154373025463465765261" )
( BigInt.new("123456789101101987654321").to_s(16) ).to_s.should eq( "1a249b1f61599cd7eab1" )
( BigInt.new("123456789101101987654321").to_s(36) ).to_s.should eq( "k3qmt029k48nmpd" )

puts "# big/big_int.cr:589 (005.cr)" # :nocode: :example:
# require "big"
123.to_big_i

puts "# big/big_int.cr:606 (006.cr)" # :nocode: :example:
# require "big"
1212341515125412412412421.0.to_big_i

puts "# big/big_int.cr:619 (007.cr)" # :nocode: :example:
# require "big"
"3a060dbf8d1a5ac3e67bc8f18843fc48".to_big_i(16)

puts "# big/big_int.cr:631 (008.cr)" # :nocode: :example:
# require "big"
Math.sqrt((1000_000_000_0000.to_big_i*1000_000_000_00000.to_big_i))


end
