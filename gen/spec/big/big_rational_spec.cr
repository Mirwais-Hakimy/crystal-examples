require "spec"
require "big"
it "big/big_rational.cr" do
puts # :nocode:

puts "# big/big_rational.cr:8 (001.cr)" # :nocode: :example:
# require "big"

r = BigRational.new(7.to_big_i, 3.to_big_i)
( r.to_s ).to_s.should eq( "7/3" )

r = BigRational.new(3, -9)
( r.to_s ).to_s.should eq( "-1/3" )

puts "# big/big_rational.cr:132 (002.cr)" # :nocode: :example:
( BigRational.new(2, 3) >> 2 ).to_s.should eq( "1/6" )

puts "# big/big_rational.cr:141 (003.cr)" # :nocode: :example:
( BigRational.new(2, 3) << 2 ).to_s.should eq( "8/3" )

puts "# big/big_rational.cr:200 (004.cr)" # :nocode: :example:
r = BigRational.new(8243243, 562828882)
( r.to_s ).to_s.should eq( "8243243/562828882" )
( r.to_s(16) ).to_s.should eq( "7dc82b/218c1652" )
( r.to_s(36) ).to_s.should eq( "4woiz/9b3djm" )

puts "# big/big_rational.cr:249 (005.cr)" # :nocode: :example:
# require "big"
123.to_big_r

puts "# big/big_rational.cr:282 (006.cr)" # :nocode: :example:
# require "big"
123.0.to_big_r

puts "# big/big_rational.cr:297 (007.cr)" # :nocode: :example:
# require "big"
Math.sqrt((1000_000_000_0000.to_big_r*1000_000_000_00000.to_big_r))


end
