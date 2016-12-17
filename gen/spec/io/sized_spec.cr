require "spec"
require "io/sized"
it "io/sized.cr" do
puts # :nocode:

puts "# io/sized.cr:3 (001.cr)" # :nocode: :example:
io = IO::Memory.new "abcde"
sized = IO::Sized.new(io, read_size: 3)

( sized.gets_to_end ).to_s.should eq( "abc" )
( sized.gets_to_end ).to_s.should eq( "" )
( io.gets_to_end ).to_s.should eq( "de" )


end
