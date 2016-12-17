require "spec"

it "file.cr" do
puts # :nocode:

puts "# file.cr:5 (001.cr)" # :nocode: :example:
file = File.new("path/to/file")
content = file.gets_to_end
file.close

# Implicit close with `open`
content = File.open("path/to/file") do |file|
  file.gets_to_end
end

# Shortcut:
content = File.read("path/to/file")

puts "# file.cr:23 (002.cr)" # :nocode: :example:
tempfile = File.tempfile("foo")

( File.size(tempfile.path) ).should eq( 6 )
File.info(tempfile.path).modification_time # => 2015-10-20 13:11:12 UTC
( File.exists?(tempfile.path) ).should eq( true )
( File.read_lines(tempfile.path) ).should eq( ["foobar"] )

puts "# file.cr:35 (003.cr)" # :nocode: :example:
( File.tempfile("foo").path ).to_s.should eq( "/tmp/foo.ulBCPS" )

puts "# file.cr:42 (004.cr)" # :nocode: :example:
tempfile = File.tempfile("foo")
tempfile.delete

puts "# file.cr:62 (005.cr)" # :nocode: :example:
File.open(File::DEVNULL) do |file|
  file.puts "this is discarded"
end

puts "# file.cr:95 (006.cr)" # :nocode: :example:
File.write("foo", "foo")
( File.info?("foo").try(&.size) ).should eq( 3 )
( File.info?("non_existent") ).should eq( nil )

File.symlink("foo", "bar")
( File.info?("bar", follow_symlinks: false).try(&.type.symlink?) ).should eq( true )

puts "# file.cr:113 (007.cr)" # :nocode: :example:
# pending by 'file:pendings/file/002.cr' # :pending:
# File.write("foo", "foo")
# File.info("foo").size              # => 3
# File.info("foo").modification_time # => 2015-09-23 06:24:19 UTC
# 
# File.symlink("foo", "bar")
# File.info("bar", follow_symlinks: false).type.symlink? # => true

puts "# file.cr:127 (008.cr)" # :nocode: :example:
File.delete("foo") if File.exists?("foo")
( File.exists?("foo") ).should eq( false )
File.write("foo", "foo")
( File.exists?("foo") ).should eq( true )

puts "# file.cr:146 (009.cr)" # :nocode: :example:
# pending by 'file:pendings/file/006.cr' # :pending:
# File.size("foo") # raises Errno
# File.write("foo", "foo")
# File.size("foo") # => 3

puts "# file.cr:160 (010.cr)" # :nocode: :example:
File.write("foo", "")
( File.empty?("foo") ).should eq( true )
File.write("foo", "foo")
( File.empty?("foo") ).should eq( false )

puts "# file.cr:172 (011.cr)" # :nocode: :example:
File.write("foo", "foo")
( File.readable?("foo") ).should eq( true )

puts "# file.cr:182 (012.cr)" # :nocode: :example:
File.write("foo", "foo")
( File.writable?("foo") ).should eq( true )

puts "# file.cr:192 (013.cr)" # :nocode: :example:
File.write("foo", "foo")
( File.executable?("foo") ).should eq( false )

puts "# file.cr:202 (014.cr)" # :nocode: :example:
File.write("foo", "")
Dir.mkdir("dir1")
( File.file?("foo") ).should eq( true )
( File.file?("dir1") ).should eq( false )
( File.file?("foobar") ).should eq( false )

puts "# file.cr:219 (015.cr)" # :nocode: :example:
File.write("foo", "")
Dir.mkdir("dir2")
( File.directory?("foo") ).should eq( false )
( File.directory?("dir2") ).should eq( true )
( File.directory?("foobar") ).should eq( false )

puts "# file.cr:232 (016.cr)" # :nocode: :example:
( File.dirname("/foo/bar/file.cr") ).to_s.should eq( "/foo/bar" )

puts "# file.cr:251 (017.cr)" # :nocode: :example:
( File.basename("/foo/bar/file.cr") ).to_s.should eq( "file.cr" )

puts "# file.cr:275 (018.cr)" # :nocode: :example:
( File.basename("/foo/bar/file.cr", ".cr") ).to_s.should eq( "file" )

puts "# file.cr:285 (019.cr)" # :nocode: :example:
# pending by 'file:pendings/file/013.cr' # :pending:
# File.chown("/foo/bar/baz.cr", 1001, 100)
# File.chown("/foo/bar", gid: 100)

puts "# file.cr:294 (020.cr)" # :nocode: :example:
File.chown("foo", gid: 100)                        # changes foo's gid
File.chown("foo", gid: 100, follow_symlinks: true) # changes baz's gid

puts "# file.cr:307 (021.cr)" # :nocode: :example:
File.chmod("foo", 0o755)
( File.info("foo").permissions.value ).should eq( 0o755 )

File.chmod("foo", 0o700)
( File.info("foo").permissions.value ).should eq( 0o700 )

puts "# file.cr:320 (022.cr)" # :nocode: :example:
# pending by 'file:pendings/file/017.cr' # :pending:
# File.write("foo", "")
# File.delete("./foo")
# File.delete("./bar") # raises Errno (No such file or directory)

puts "# file.cr:331 (023.cr)" # :nocode: :example:
( File.extname("foo.cr") ).to_s.should eq( ".cr" )

puts "# file.cr:377 (024.cr)" # :nocode: :example:
# pending by 'file:pendings/file/018.cr' # :pending:
# File.expand_path("foo")             # => "/home/.../foo"
# File.expand_path("~/crystal/foo")   # => "/home/crystal/foo"
# File.expand_path("baz", "/foo/bar") # => "/foo/bar/baz"

puts "# file.cr:668 (025.cr)" # :nocode: :example:
File.write("bar", "foo")
( File.read("bar") ).to_s.should eq( "foo" )

puts "# file.cr:692 (026.cr)" # :nocode: :example:
File.write("foobar", "foo\nbar")

array = [] of String
File.each_line("foobar") do |line|
  array << line
end
( array ).should eq( ["foo", "bar"] )

puts "# file.cr:711 (027.cr)" # :nocode: :example:
File.write("foobar", "foo\nbar")
( File.read_lines("foobar") ).should eq( ["foo", "bar"] )

puts "# file.cr:731 (028.cr)" # :nocode: :example:
File.write("foo", "bar")
File.write("foo", "baz", mode: "a")

puts "# file.cr:755 (029.cr)" # :nocode: :example:
( File.join("foo", "bar", "baz") ).to_s.should eq( "foo/bar/baz" )
( File.join("foo/", "/bar/", "/baz") ).to_s.should eq( "foo/bar/baz" )
( File.join("/foo/", "/bar/", "/baz/") ).to_s.should eq( "/foo/bar/baz/" )

puts "# file.cr:766 (030.cr)" # :nocode: :example:
( File.join({"foo", "bar", "baz"}) ).to_s.should eq( "foo/bar/baz" )
( File.join({"foo/", "/bar/", "/baz"}) ).to_s.should eq( "foo/bar/baz" )
( File.join(["/foo/", "/bar/", "/baz/"]) ).to_s.should eq( "/foo/bar/baz/" )

puts "# file.cr:803 (031.cr)" # :nocode: :example:
File.write("afile", "foo")
( File.exists?("afile") ).should eq( true )

File.rename("afile", "afile.cr")
( File.exists?("afile") ).should eq( false )
( File.exists?("afile.cr") ).should eq( true )


end
