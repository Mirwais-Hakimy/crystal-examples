# io.cr:140
reader, writer = IO.pipe
writer.puts "hello"
writer.puts "world"
reader.gets # => "hello"
reader.gets # => "world"
