# dir.cr: 5 examples

# dir.cr:41 (001.cr)
Dir.mkdir("testdir")
File.write("testdir/config.h", "")

d = Dir.new("testdir")
d.each { |x| puts "Got #{x}" }

# dir.cr:78 (002.cr)
# pending by 'file:pendings/dir/002.cr'
# Dir.mkdir("testdir")
# File.write("testdir/config.h", "")
# 
# d = Dir.new("testdir")
# d.each_child { |x| puts "Got #{x}" }

# dir.cr:114 (003.cr)
d = Dir.new("testdir")
array = [] of String
while file = d.read
  array << file
end
array.sort # => [".", "..", "config.h"]

# dir.cr:164 (004.cr)
Dir.tempdir # => "/tmp"

# dir.cr:215 (005.cr)
Dir.mkdir("bar")
Dir.empty?("bar") # => true
File.write("bar/a_file", "The content")
Dir.empty?("bar") # => false
