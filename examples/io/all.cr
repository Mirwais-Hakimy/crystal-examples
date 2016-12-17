# io.cr: 42 examples

# io.cr:21 (001.cr)
class SimpleSliceIO < IO
  def initialize(@slice : Bytes)
  end

  def read(slice : Bytes)
    slice.size.times { |i| slice[i] = @slice[i] }
    @slice += slice.size
    slice.size
  end

  def write(slice : Bytes)
    slice.size.times { |i| @slice[i] = slice[i] }
    @slice += slice.size
    nil
  end
end

slice = Slice.new(9) { |i| ('a'.ord + i).to_u8 }
String.new(slice) # => "abcdefghi"

io = SimpleSliceIO.new(slice)
io.gets(3) # => "abc"
io.print "xyz"
String.new(slice) # => "abcxyzghi"

# io.cr:82 (002.cr)
STDIN.read_timeout = 1
STDIN.gets # raises IO::Timeout (after 1 second)

# io.cr:93 (003.cr)
io = IO::Memory.new "hello"
slice = Bytes.new(4)
io.read(slice) # => 4
slice          # => Bytes[104, 101, 108, 108]
io.read(slice) # => 1
slice          # => Bytes[111, 101, 108, 108]
io.read(slice) # => 0

# io.cr:106 (004.cr)
io = IO::Memory.new
slice = Bytes.new(4) { |i| ('a'.ord + i).to_u8 }
io.write(slice)
io.to_s # => "abcd"

# io.cr:140 (005.cr)
reader, writer = IO.pipe
writer.puts "hello"
writer.puts "world"
reader.gets # => "hello"
reader.gets # => "world"

# io.cr:154 (006.cr)
IO.pipe do |reader, writer|
  writer.puts "hello"
  writer.puts "world"
  reader.gets # => "hello"
  reader.gets # => "world"
end

# io.cr:176 (007.cr)
io = IO::Memory.new
io << 1
io << '-'
io << "Crystal"
io.to_s # => "1-Crystal"

# io.cr:190 (008.cr)
io = IO::Memory.new
io.print 1
io.print '-'
io.print "Crystal"
io.to_s # => "1-Crystal"

# io.cr:205 (009.cr)
io = IO::Memory.new
io.print 1, '-', "Crystal"
io.to_s # => "1-Crystal"

# io.cr:220 (010.cr)
io = IO::Memory.new
io.puts "hello\n"
io.puts "world"
io.to_s # => "hello\nworld\n"

# io.cr:234 (011.cr)
io = IO::Memory.new
io.puts 1
io.puts "Crystal"
io.to_s # => "1\nCrystal\n"

# io.cr:247 (012.cr)
io = IO::Memory.new
io.puts
io.to_s # => "\n"

# io.cr:259 (013.cr)
io = IO::Memory.new
io.puts 1, '-', "Crystal"
io.to_s # => "1\n-\nCrystal\n"

# io.cr:286 (014.cr)
io = IO::Memory.new "a"
io.read_byte # => 97
io.read_byte # => nil

# io.cr:303 (015.cr)
io = IO::Memory.new "あ"
io.read_char # => 'あ'
io.read_char # => nil

# io.cr:390 (016.cr)
bytes = "你".encode("GB2312") # => Bytes[196, 227]

io = IO::Memory.new(bytes)
io.set_encoding("GB2312")
io.read_utf8_byte # => 228
io.read_utf8_byte # => 189
io.read_utf8_byte # => 160
io.read_utf8_byte # => nil

"你".bytes # => [228, 189, 160]

# io.cr:415 (017.cr)
bytes = "你".encode("GB2312") # => Bytes[196, 227]

io = IO::Memory.new(bytes)
io.set_encoding("GB2312")

buffer = uninitialized UInt8[1024]
bytes_read = io.read_utf8(buffer.to_slice) # => 3
buffer.to_slice[0, bytes_read]             # => Bytes[228, 189, 160]

"你".bytes # => [228, 189, 160]

# io.cr:439 (018.cr)
io = IO::Memory.new("hello world")
io.read_string(5) # => "hello"
io.read_string(1) # => " "
# io.read_string(6) # raises IO::EOFError

# io.cr:505 (019.cr)
io = IO::Memory.new "123451234"
slice = Bytes.new(5)
io.read_fully(slice) # => 5
slice                # => Bytes[49, 50, 51, 52, 53]
# io.read_fully(slice) # raises IO::EOFError

# io.cr:520 (020.cr)
io = IO::Memory.new "123451234"
slice = Bytes.new(5)
io.read_fully?(slice) # => 5
slice                 # => Bytes[49, 50, 51, 52, 53]
io.read_fully?(slice) # => nil

# io.cr:539 (021.cr)
io = IO::Memory.new "hello world"
io.gets_to_end # => "hello world"

# io.cr:567 (022.cr)
io = IO::Memory.new "hello\nworld\nfoo\n"
io.gets               # => "hello"
io.gets(chomp: false) # => "world\n"
io.gets               # => "foo"
io.gets               # => nil

# io.cr:582 (023.cr)
io = IO::Memory.new "hello\nworld"
io.gets(3) # => "hel"
io.gets(3) # => "lo\n"
io.gets(3) # => "wor"
io.gets(3) # => "ld"
io.gets(3) # => nil

# io.cr:597 (024.cr)
io = IO::Memory.new "hello\nworld"
io.gets('o') # => "hello"
io.gets('r') # => "\nwor"
io.gets('z') # => "ld"
io.gets('w') # => nil

# io.cr:611 (025.cr)
io = IO::Memory.new "hello\nworld"
io.gets('o', 3)  # => "hel"
io.gets('r', 10) # => "lo\nwor"
io.gets('z', 10) # => "ld"
io.gets('w', 10) # => nil

# io.cr:767 (026.cr)
io = IO::Memory.new "hello\nworld"
io.gets("wo") # => "hello\nwo"
io.gets("wo") # => "rld"
io.gets("wo") # => nil

# io.cr:820 (027.cr)
io = IO::Memory.new "hello world"
io.skip(6)
io.gets    # => "world"
# io.skip(1) # raises IO::EOFError

# io.cr:846 (028.cr)
io = IO::Memory.new
io.write_byte 97_u8
io.to_s # => "a"

# io.cr:864 (029.cr)
io = IO::Memory.new
io.write_bytes(0x01020304, IO::ByteFormat::LittleEndian)
io.rewind
io.gets(4) # => "\u{4}\u{3}\u{2}\u{1}"

# io.cr:882 (030.cr)
io = IO::Memory.new
io.puts "\u{4}\u{3}\u{2}\u{1}"
io.rewind
io.read_bytes(Int32, IO::ByteFormat::LittleEndian) # => 0x01020304

# io.cr:896 (031.cr)
STDIN.tty?          # => true
IO::Memory.new.tty? # => false

# io.cr:908 (032.cr)
io = IO::Memory.new("hello\nworld")
io.each_line do |line|
  puts line.chomp.reverse
end

# io.cr:931 (033.cr)
io = IO::Memory.new("hello\nworld")
iter = io.each_line
iter.next # => "hello"
iter.next # => "world"

# io.cr:943 (034.cr)
io = IO::Memory.new("あめ")
io.each_char do |char|
  puts char
end

# io.cr:964 (035.cr)
io = IO::Memory.new("あめ")
iter = io.each_char
iter.next # => 'あ'
iter.next # => 'め'

# io.cr:976 (036.cr)
io = IO::Memory.new("aあ")
io.each_byte do |byte|
  puts byte
end

# io.cr:999 (037.cr)
io = IO::Memory.new("aあ")
iter = io.each_byte
iter.next # => 97
iter.next # => 227
iter.next # => 129
iter.next # => 130

# io.cr:1058 (038.cr)
File.write("testfile", "abc")

file = File.new("testfile")
file.gets(3) # => "abc"
file.seek(1, IO::Seek::Set)
file.gets(2) # => "bc"
file.seek(-1, IO::Seek::Current)
file.gets(1) # => "c"

# io.cr:1077 (039.cr)
File.write("testfile", "hello")

file = File.new("testfile")
file.pos     # => 0
file.gets(2) # => "he"
file.pos     # => 2

# io.cr:1094 (040.cr)
File.write("testfile", "hello")

file = File.new("testfile")
file.pos = 3
file.gets_to_end # => "lo"

# io.cr:1122 (041.cr)
io = IO::Memory.new "hello"
io2 = IO::Memory.new

IO.copy io, io2

io2.to_s # => "hello"

# io.cr:1142 (042.cr)
io = IO::Memory.new "hello"
io2 = IO::Memory.new

IO.copy io, io2, 3

io2.to_s # => "hel"
