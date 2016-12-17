require "spec"
require "bit_array"
it "bit_array.cr" do
puts # :nocode:

puts "# bit_array.cr:11 (001.cr)" # :nocode: :example:
# require "bit_array"

( ba = BitArray.new(12) ).to_s.should eq( "BitArray[000000000000]" )
( ba[2] ).should eq( false )
0.upto(5) { |i| ba[i * 2] = true }
( ba ).to_s.should eq( "BitArray[101010101010]" )
( ba[2] ).should eq( true )

puts "# bit_array.cr:56 (002.cr)" # :nocode: :example:
ba = BitArray.new(5)
ba[3] = true

puts "# bit_array.cr:77 (003.cr)" # :nocode: :example:
ba = BitArray.new(5)
ba[0] = true; ba[2] = true; ba[4] = true
( ba ).to_s.should eq( "BitArray[10101]" )

( ba[1..3] ).to_s.should eq( "BitArray[010]" )
( ba[4..7] ).to_s.should eq( "BitArray[1]" )
# ba[6..10]   # raise IndexError
( ba[5..10] ).to_s.should eq( "BitArray[]" )
( ba[-2...-1] ).to_s.should eq( "BitArray[0]" )

puts "# bit_array.cr:101 (004.cr)" # :nocode: :example:
ba = BitArray.new(5)
ba[0] = true; ba[2] = true; ba[4] = true
( ba ).to_s.should eq( "BitArray[10101]" )

( ba[-3, 3] ).to_s.should eq( "BitArray[101]" )
# ba[6, 1]  # raise indexError
( ba[1, 2] ).to_s.should eq( "BitArray[01]" )
( ba[5, 1] ).to_s.should eq( "BitArray[]" )

puts "# bit_array.cr:177 (005.cr)" # :nocode: :example:
ba = BitArray.new(5)
( ba[3] ).should eq( false )
ba.toggle(3)
( ba[3] ).should eq( true )

puts "# bit_array.cr:190 (006.cr)" # :nocode: :example:
ba = BitArray.new(5)
ba[2] = true; ba[3] = true
( ba ).to_s.should eq( "BitArray[00110]" )
ba.invert
( ba ).to_s.should eq( "BitArray[11001]" )

puts "# bit_array.cr:205 (007.cr)" # :nocode: :example:
ba = BitArray.new(5)
( ba.to_s ).to_s.should eq( "BitArray[00000]" )


end
