# io.cr:1058
File.write("testfile", "abc")

file = File.new("testfile")
file.gets(3) # => "abc"
file.seek(1, IO::Seek::Set)
file.gets(2) # => "bc"
file.seek(-1, IO::Seek::Current)
file.gets(1) # => "c"
