require "spec"

it "number.cr" do
puts # :nocode:

puts "# number.cr:19 (001.cr)" # :nocode: :example:
floats = Float64[1, 2, 3, 4]
( floats.class ).should eq( Array(Float64) )

ints = Int64[1, 2, 3]
( ints.class ).should eq( Array(Int64) )

puts "# number.cr:40 (002.cr)" # :nocode: :example:
floats = Float64.slice(1, 2, 3, 4)
( floats.class ).should eq( Slice(Float64) )

ints = Int64.slice(1, 2, 3)
( ints.class ).should eq( Slice(Int64) )

puts "# number.cr:58 (003.cr)" # :nocode: :example:
floats = Float64.static_array(1, 2, 3, 4)
( floats.class ).should eq( StaticArray(Float64, 4) )

ints = Int64.static_array(1, 2, 3)
( ints.class ).should eq( StaticArray(Int64, 3) )

puts "# number.cr:76 (004.cr)" # :nocode: :example:
3.step(to: 10, by: 2) do |n|
  puts n
end

puts "# number.cr:121 (005.cr)" # :nocode: :example:
( 123.abs ).should eq( 123 )
( -123.abs ).should eq( 123 )

puts "# number.cr:131 (006.cr)" # :nocode: :example:
( 4.abs2 ).should eq( 16 )
( 1.5.abs2 ).try(&.to_f).to_s.should eq( "2.25" )

puts "# number.cr:144 (007.cr)" # :nocode: :example:
( 123.sign ).should eq( 1 )
( 0.sign ).should eq( 0 )
( -42.sign ).should eq( -1 )

puts "# number.cr:156 (008.cr)" # :nocode: :example:
( 11.divmod(3) ).should eq( {3, 2} )
( 11.divmod(-3) ).should eq( {-4, -1} )

puts "# number.cr:173 (009.cr)" # :nocode: :example:
# pending by 'file:pendings/number/009.cr' # :pending:
# 1234.567.significant(1) # => 1000
# 1234.567.significant(2) # => 1200
# 1234.567.significant(3) # => 1230
# 1234.567.significant(4) # => 1235
# 1234.567.significant(5) # => 1234.6
# 1234.567.significant(6) # => 1234.57
# 1234.567.significant(7) # => 1234.567
# 1234.567.significant(8) # => 1234.567
# 
# 15.159.significant(1, base = 2) # => 16

puts "# number.cr:209 (010.cr)" # :nocode: :example:
( -1763.116.round(2) ).should eq( -1763.12 )

puts "# number.cr:225 (011.cr)" # :nocode: :example:
( 5.clamp(10..100) ).should eq( 10 )
( 50.clamp(10..100) ).should eq( 50 )
( 500.clamp(10..100) ).should eq( 100 )

puts "# number.cr:237 (012.cr)" # :nocode: :example:
( 5.clamp(10, 100) ).should eq( 10 )
( 50.clamp(10, 100) ).should eq( 50 )
( 500.clamp(10, 100) ).should eq( 100 )

puts "# number.cr:250 (013.cr)" # :nocode: :example:
( 0.zero? ).should eq( true )
( 5.zero? ).should eq( false )


end
