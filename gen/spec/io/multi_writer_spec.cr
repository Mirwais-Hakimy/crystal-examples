require "spec"
require "io/multi_writer"
it "io/multi_writer.cr" do
puts # :nocode:

puts "# io/multi_writer.cr:3 (001.cr)" # :nocode: :example:
io1 = IO::Memory.new
io2 = IO::Memory.new
writer = IO::MultiWriter.new(io1, io2)
writer.puts "foo bar"
( io1.to_s ).to_s.should eq( "foo bar\n" )
( io2.to_s ).to_s.should eq( "foo bar\n" )


end
