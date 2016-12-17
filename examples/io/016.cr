# io.cr:390
bytes = "你".encode("GB2312") # => Bytes[196, 227]

io = IO::Memory.new(bytes)
io.set_encoding("GB2312")
io.read_utf8_byte # => 228
io.read_utf8_byte # => 189
io.read_utf8_byte # => 160
io.read_utf8_byte # => nil

"你".bytes # => [228, 189, 160]
