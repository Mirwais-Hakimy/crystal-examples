# io/memory.cr: 14 examples

# io/memory.cr:17 (001.cr)
io = IO::Memory.new
slice = Bytes.new(1)
io.pos         # => 0
io.read(slice) # => 0
slice          # => Bytes[0]

# io/memory.cr:41 (002.cr)
slice = Slice.new(6) { |i| ('a'.ord + i).to_u8 }
io = IO::Memory.new slice, writeable: false
io.pos            # => 0
io.read(slice)    # => 6
String.new(slice) # => "abcdef"

# io/memory.cr:62 (003.cr)
io = IO::Memory.new "hello"
io.pos        # => 0
io.gets(2)    # => "he"
# io.print "hi" # raises IO::Error

# io/memory.cr:235 (004.cr)
io = IO::Memory.new
io << "abc"
io.rewind
io.gets(1) # => "a"
io.clear
io.pos         # => 0
io.gets_to_end # => ""

io = IO::Memory.new "hello"
# io.clear # raises IO::Error

# io/memory.cr:256 (005.cr)
io = IO::Memory.new
io.empty? # => true
io.print "hello"
io.empty? # => false

# io/memory.cr:268 (006.cr)
io = IO::Memory.new "hello"
io.gets(2) # => "he"
io.rewind
io.gets(2) # => "he"

# io/memory.cr:281 (007.cr)
io = IO::Memory.new "hello"
io.size # => 5

# io/memory.cr:291 (008.cr)
io = IO::Memory.new("abcdef")
io.gets(3) # => "abc"
io.seek(1, IO::Seek::Set)
io.gets(2) # => "bc"
io.seek(-1, IO::Seek::Current)
io.gets(1) # => "c"

# io/memory.cr:316 (009.cr)
io = IO::Memory.new "hello"
io.pos     # => 0
io.gets(2) # => "he"
io.pos     # => 2

# io/memory.cr:328 (010.cr)
io = IO::Memory.new "hello"
io.pos = 3
io.gets # => "lo"

# io/memory.cr:372 (011.cr)
io = IO::Memory.new "hello"
io.close
# io.gets_to_end # raises IO::Error (closed stream)

# io/memory.cr:383 (012.cr)
io = IO::Memory.new "hello"
io.closed? # => false
io.close
io.closed? # => true

# io/memory.cr:395 (013.cr)
io = IO::Memory.new
io.print 1, 2, 3
io.to_s # => "123"

# io/memory.cr:406 (014.cr)
io = IO::Memory.new
io.print "hello"

io.to_slice # => Bytes[104, 101, 108, 108, 111]
