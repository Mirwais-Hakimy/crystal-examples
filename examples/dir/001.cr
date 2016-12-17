# dir.cr:41
Dir.mkdir("testdir")
File.write("testdir/config.h", "")

d = Dir.new("testdir")
d.each { |x| puts "Got #{x}" }
