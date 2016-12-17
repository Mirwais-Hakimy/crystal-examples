# io.cr:220
io = IO::Memory.new
io.puts "hello\n"
io.puts "world"
io.to_s # => "hello\nworld\n"
