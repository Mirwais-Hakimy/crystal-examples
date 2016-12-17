require "spec"
require "file/tempfile"
it "file/tempfile.cr" do
puts # :nocode:

puts "# file/tempfile.cr:5 (001.cr)" # :nocode: :example:
( File.tempname("foo", ".sock") ).to_s.should eq( "/tmp/foo20171206-1234-449386.sock" )

puts "# file/tempfile.cr:40 (002.cr)" # :nocode: :example:
( File.tempname ).to_s.should eq( "/tmp/20171206-1234-449386" )
( File.tempname(".sock") ).to_s.should eq( "/tmp/20171206-1234-449386.sock" )

puts "# file/tempfile.cr:50 (003.cr)" # :nocode: :example:
tempfile = File.tempfile("foo", ".bar")
tempfile.delete

puts "# file/tempfile.cr:70 (004.cr)" # :nocode: :example:
tempfile = File.tempfile(".bar")
tempfile.delete

puts "# file/tempfile.cr:89 (005.cr)" # :nocode: :example:
tempfile = File.tempfile("foo", ".bar") do |file|
  file.print("bar")
end
( File.read(tempfile.path) ).to_s.should eq( "bar" )
tempfile.delete

puts "# file/tempfile.cr:117 (006.cr)" # :nocode: :example:
tempfile = File.tempfile(".bar") do |file|
  file.print("bar")
end
( File.read(tempfile.path) ).to_s.should eq( "bar" )
tempfile.delete


end
