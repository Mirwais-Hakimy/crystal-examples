# io/memory.cr:41
slice = Slice.new(6) { |i| ('a'.ord + i).to_u8 }
io = IO::Memory.new slice, writeable: false
io.pos            # => 0
io.read(slice)    # => 6
String.new(slice) # => "abcdef"
