# file.cr: 31 examples

# file.cr:5 (001.cr)
file = File.new("path/to/file")
content = file.gets_to_end
file.close

# Implicit close with `open`
content = File.open("path/to/file") do |file|
  file.gets_to_end
end

# Shortcut:
content = File.read("path/to/file")

# file.cr:23 (002.cr)
tempfile = File.tempfile("foo")

File.size(tempfile.path)                   # => 6
File.info(tempfile.path).modification_time # => 2015-10-20 13:11:12 UTC
File.exists?(tempfile.path)                # => true
File.read_lines(tempfile.path)             # => ["foobar"]

# file.cr:35 (003.cr)
File.tempfile("foo").path # => "/tmp/foo.ulBCPS"

# file.cr:42 (004.cr)
tempfile = File.tempfile("foo")
tempfile.delete

# file.cr:62 (005.cr)
File.open(File::DEVNULL) do |file|
  file.puts "this is discarded"
end

# file.cr:95 (006.cr)
File.write("foo", "foo")
File.info?("foo").try(&.size) # => 3
File.info?("non_existent")    # => nil

File.symlink("foo", "bar")
File.info?("bar", follow_symlinks: false).try(&.type.symlink?) # => true

# file.cr:113 (007.cr)
# pending by 'file:pendings/file/002.cr'
# File.write("foo", "foo")
# File.info("foo").size              # => 3
# File.info("foo").modification_time # => 2015-09-23 06:24:19 UTC
# 
# File.symlink("foo", "bar")
# File.info("bar", follow_symlinks: false).type.symlink? # => true

# file.cr:127 (008.cr)
File.delete("foo") if File.exists?("foo")
File.exists?("foo") # => false
File.write("foo", "foo")
File.exists?("foo") # => true

# file.cr:146 (009.cr)
# pending by 'file:pendings/file/006.cr'
# File.size("foo") # raises Errno
# File.write("foo", "foo")
# File.size("foo") # => 3

# file.cr:160 (010.cr)
File.write("foo", "")
File.empty?("foo") # => true
File.write("foo", "foo")
File.empty?("foo") # => false

# file.cr:172 (011.cr)
File.write("foo", "foo")
File.readable?("foo") # => true

# file.cr:182 (012.cr)
File.write("foo", "foo")
File.writable?("foo") # => true

# file.cr:192 (013.cr)
File.write("foo", "foo")
File.executable?("foo") # => false

# file.cr:202 (014.cr)
File.write("foo", "")
Dir.mkdir("dir1")
File.file?("foo")    # => true
File.file?("dir1")   # => false
File.file?("foobar") # => false

# file.cr:219 (015.cr)
File.write("foo", "")
Dir.mkdir("dir2")
File.directory?("foo")    # => false
File.directory?("dir2")   # => true
File.directory?("foobar") # => false

# file.cr:232 (016.cr)
File.dirname("/foo/bar/file.cr") # => "/foo/bar"

# file.cr:251 (017.cr)
File.basename("/foo/bar/file.cr") # => "file.cr"

# file.cr:275 (018.cr)
File.basename("/foo/bar/file.cr", ".cr") # => "file"

# file.cr:285 (019.cr)
# pending by 'file:pendings/file/013.cr'
# File.chown("/foo/bar/baz.cr", 1001, 100)
# File.chown("/foo/bar", gid: 100)

# file.cr:294 (020.cr)
File.chown("foo", gid: 100)                        # changes foo's gid
File.chown("foo", gid: 100, follow_symlinks: true) # changes baz's gid

# file.cr:307 (021.cr)
File.chmod("foo", 0o755)
File.info("foo").permissions.value # => 0o755

File.chmod("foo", 0o700)
File.info("foo").permissions.value # => 0o700

# file.cr:320 (022.cr)
# pending by 'file:pendings/file/017.cr'
# File.write("foo", "")
# File.delete("./foo")
# File.delete("./bar") # raises Errno (No such file or directory)

# file.cr:331 (023.cr)
File.extname("foo.cr") # => ".cr"

# file.cr:377 (024.cr)
# pending by 'file:pendings/file/018.cr'
# File.expand_path("foo")             # => "/home/.../foo"
# File.expand_path("~/crystal/foo")   # => "/home/crystal/foo"
# File.expand_path("baz", "/foo/bar") # => "/foo/bar/baz"

# file.cr:668 (025.cr)
File.write("bar", "foo")
File.read("bar") # => "foo"

# file.cr:692 (026.cr)
File.write("foobar", "foo\nbar")

array = [] of String
File.each_line("foobar") do |line|
  array << line
end
array # => ["foo", "bar"]

# file.cr:711 (027.cr)
File.write("foobar", "foo\nbar")
File.read_lines("foobar") # => ["foo", "bar"]

# file.cr:731 (028.cr)
File.write("foo", "bar")
File.write("foo", "baz", mode: "a")

# file.cr:755 (029.cr)
File.join("foo", "bar", "baz")       # => "foo/bar/baz"
File.join("foo/", "/bar/", "/baz")   # => "foo/bar/baz"
File.join("/foo/", "/bar/", "/baz/") # => "/foo/bar/baz/"

# file.cr:766 (030.cr)
File.join({"foo", "bar", "baz"})       # => "foo/bar/baz"
File.join({"foo/", "/bar/", "/baz"})   # => "foo/bar/baz"
File.join(["/foo/", "/bar/", "/baz/"]) # => "/foo/bar/baz/"

# file.cr:803 (031.cr)
File.write("afile", "foo")
File.exists?("afile") # => true

File.rename("afile", "afile.cr")
File.exists?("afile")    # => false
File.exists?("afile.cr") # => true
