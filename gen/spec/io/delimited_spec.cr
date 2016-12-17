require "spec"
require "io/delimited"
it "io/delimited.cr" do
puts # :nocode:

puts "# io/delimited.cr:6 (001.cr)" # :nocode: :example:
io = IO::Memory.new "abc||123"
delimited = IO::Delimited.new(io, read_delimiter: "||")

( delimited.gets_to_end ).to_s.should eq( "abc" )
( delimited.gets_to_end ).to_s.should eq( "" )
( io.gets_to_end ).to_s.should eq( "123" )


end
