# dir.cr:78
Dir.mkdir("testdir")
File.write("testdir/config.h", "")

d = Dir.new("testdir")
d.each_child { |x| puts "Got #{x}" }
