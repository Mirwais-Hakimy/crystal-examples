# io.cr:1094
File.write("testfile", "hello")

file = File.new("testfile")
file.pos = 3
file.gets_to_end # => "lo"
