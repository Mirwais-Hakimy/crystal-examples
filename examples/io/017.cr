# io.cr:415
bytes = "你".encode("GB2312") # => Bytes[196, 227]

io = IO::Memory.new(bytes)
io.set_encoding("GB2312")

buffer = uninitialized UInt8[1024]
bytes_read = io.read_utf8(buffer.to_slice) # => 3
buffer.to_slice[0, bytes_read]             # => Bytes[228, 189, 160]

"你".bytes # => [228, 189, 160]
