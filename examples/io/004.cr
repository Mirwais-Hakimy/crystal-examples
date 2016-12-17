# io.cr:106
io = IO::Memory.new
slice = Bytes.new(4) { |i| ('a'.ord + i).to_u8 }
io.write(slice)
io.to_s # => "abcd"
