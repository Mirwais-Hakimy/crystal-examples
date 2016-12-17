require "spec"

it "dir.cr" do
puts # :nocode:

puts "# dir.cr:41 (001.cr)" # :nocode: :example:
Dir.mkdir("testdir")
File.write("testdir/config.h", "")

d = Dir.new("testdir")
d.each { |x| puts "Got #{x}" }

puts "# dir.cr:78 (002.cr)" # :nocode: :example:
# pending by 'file:pendings/dir/002.cr' # :pending:
# Dir.mkdir("testdir")
# File.write("testdir/config.h", "")
# 
# d = Dir.new("testdir")
# d.each_child { |x| puts "Got #{x}" }

puts "# dir.cr:114 (003.cr)" # :nocode: :example:
d = Dir.new("testdir")
array = [] of String
while file = d.read
  array << file
end
( array.sort ).should eq( [".", "..", "config.h"] )

puts "# dir.cr:164 (004.cr)" # :nocode: :example:
( Dir.tempdir ).to_s.should eq( "/tmp" )

puts "# dir.cr:215 (005.cr)" # :nocode: :example:
Dir.mkdir("bar")
( Dir.empty?("bar") ).should eq( true )
File.write("bar/a_file", "The content")
( Dir.empty?("bar") ).should eq( false )


end
