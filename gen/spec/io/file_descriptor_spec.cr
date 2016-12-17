require "spec"
require "io/file_descriptor"
it "io/file_descriptor.cr" do
puts # :nocode:

puts "# io/file_descriptor.cr:70 (001.cr)" # :nocode: :example:
File.write("testfile", "abc")

file = File.new("testfile")
( file.gets(3) ).to_s.should eq( "abc" )
file.seek(1, IO::Seek::Set)
( file.gets(2) ).to_s.should eq( "bc" )
file.seek(-1, IO::Seek::Current)
( file.gets(1) ).to_s.should eq( "c" )

puts "# io/file_descriptor.cr:107 (002.cr)" # :nocode: :example:
File.write("testfile", "hello")

file = File.new("testfile")
( file.pos ).should eq( 0 )
( file.gets(2) ).to_s.should eq( "he" )
( file.pos ).should eq( 2 )

puts "# io/file_descriptor.cr:123 (003.cr)" # :nocode: :example:
File.write("testfile", "hello")

file = File.new("testfile")
file.pos = 3
( file.gets_to_end ).to_s.should eq( "lo" )


end
