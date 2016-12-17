require "spec"

puts "# io.cr:21 (001.cr)" # :nocode: :example:
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
( String.new(slice) ).to_s.should eq( "abcdefghi" )

io = SimpleSliceIO.new(slice)
( io.gets(3) ).to_s.should eq( "abc" )
io.print "xyz"
( String.new(slice) ).to_s.should eq( "abcxyzghi" )

puts "# io.cr:82 (002.cr)" # :nocode: :example:
STDIN.read_timeout = 1
expect_raises(IO::Timeout) { STDIN.gets }

puts "# io.cr:93 (003.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
slice = Bytes.new(4)
( io.read(slice) ).should eq( 4 )
( slice ).should eq( Bytes[104, 101, 108, 108] )
( io.read(slice) ).should eq( 1 )
( slice ).should eq( Bytes[111, 101, 108, 108] )
( io.read(slice) ).should eq( 0 )

puts "# io.cr:106 (004.cr)" # :nocode: :example:
io = IO::Memory.new
slice = Bytes.new(4) { |i| ('a'.ord + i).to_u8 }
io.write(slice)
( io.to_s ).to_s.should eq( "abcd" )

puts "# io.cr:140 (005.cr)" # :nocode: :example:
reader, writer = IO.pipe
writer.puts "hello"
writer.puts "world"
( reader.gets ).to_s.should eq( "hello" )
( reader.gets ).to_s.should eq( "world" )

puts "# io.cr:154 (006.cr)" # :nocode: :example:
IO.pipe do |reader, writer|
  writer.puts "hello"
  writer.puts "world"
(   reader.gets ).to_s.should eq( "hello" )
(   reader.gets ).to_s.should eq( "world" )
end

puts "# io.cr:176 (007.cr)" # :nocode: :example:
io = IO::Memory.new
io << 1
io << '-'
io << "Crystal"
( io.to_s ).to_s.should eq( "1-Crystal" )

puts "# io.cr:190 (008.cr)" # :nocode: :example:
io = IO::Memory.new
io.print 1
io.print '-'
io.print "Crystal"
( io.to_s ).to_s.should eq( "1-Crystal" )

puts "# io.cr:205 (009.cr)" # :nocode: :example:
io = IO::Memory.new
io.print 1, '-', "Crystal"
( io.to_s ).to_s.should eq( "1-Crystal" )

puts "# io.cr:220 (010.cr)" # :nocode: :example:
io = IO::Memory.new
io.puts "hello\n"
io.puts "world"
( io.to_s ).to_s.should eq( "hello\nworld\n" )

puts "# io.cr:234 (011.cr)" # :nocode: :example:
io = IO::Memory.new
io.puts 1
io.puts "Crystal"
( io.to_s ).to_s.should eq( "1\nCrystal\n" )

puts "# io.cr:247 (012.cr)" # :nocode: :example:
io = IO::Memory.new
io.puts
( io.to_s ).to_s.should eq( "\n" )

puts "# io.cr:259 (013.cr)" # :nocode: :example:
io = IO::Memory.new
io.puts 1, '-', "Crystal"
( io.to_s ).to_s.should eq( "1\n-\nCrystal\n" )

puts "# io.cr:286 (014.cr)" # :nocode: :example:
io = IO::Memory.new "a"
( io.read_byte ).should eq( 97 )
( io.read_byte ).should eq( nil )

puts "# io.cr:303 (015.cr)" # :nocode: :example:
io = IO::Memory.new "あ"
( io.read_char ).should eq( 'あ' )
( io.read_char ).should eq( nil )

puts "# io.cr:390 (016.cr)" # :nocode: :example:
( bytes = "你".encode("GB2312") ).should eq( Bytes[196, 227] )

io = IO::Memory.new(bytes)
io.set_encoding("GB2312")
( io.read_utf8_byte ).should eq( 228 )
( io.read_utf8_byte ).should eq( 189 )
( io.read_utf8_byte ).should eq( 160 )
( io.read_utf8_byte ).should eq( nil )

( "你".bytes ).should eq( [228, 189, 160] )

puts "# io.cr:415 (017.cr)" # :nocode: :example:
( bytes = "你".encode("GB2312") ).should eq( Bytes[196, 227] )

io = IO::Memory.new(bytes)
io.set_encoding("GB2312")

buffer = uninitialized UInt8[1024]
( bytes_read = io.read_utf8(buffer.to_slice) ).should eq( 3 )
( buffer.to_slice[0, bytes_read] ).should eq( Bytes[228, 189, 160] )

( "你".bytes ).should eq( [228, 189, 160] )

puts "# io.cr:439 (018.cr)" # :nocode: :example:
io = IO::Memory.new("hello world")
( io.read_string(5) ).to_s.should eq( "hello" )
( io.read_string(1) ).to_s.should eq( " " )
expect_raises(IO::EOFError) { io.read_string(6) }

puts "# io.cr:505 (019.cr)" # :nocode: :example:
io = IO::Memory.new "123451234"
slice = Bytes.new(5)
( io.read_fully(slice) ).should eq( 5 )
( slice ).should eq( Bytes[49, 50, 51, 52, 53] )
expect_raises(IO::EOFError) { io.read_fully(slice) }

puts "# io.cr:520 (020.cr)" # :nocode: :example:
io = IO::Memory.new "123451234"
slice = Bytes.new(5)
( io.read_fully?(slice) ).should eq( 5 )
( slice ).should eq( Bytes[49, 50, 51, 52, 53] )
( io.read_fully?(slice) ).should eq( nil )

puts "# io.cr:539 (021.cr)" # :nocode: :example:
io = IO::Memory.new "hello world"
( io.gets_to_end ).to_s.should eq( "hello world" )

puts "# io.cr:567 (022.cr)" # :nocode: :example:
io = IO::Memory.new "hello\nworld\nfoo\n"
( io.gets ).to_s.should eq( "hello" )
( io.gets(chomp: false) ).to_s.should eq( "world\n" )
( io.gets ).to_s.should eq( "foo" )
( io.gets ).should eq( nil )

puts "# io.cr:582 (023.cr)" # :nocode: :example:
io = IO::Memory.new "hello\nworld"
( io.gets(3) ).to_s.should eq( "hel" )
( io.gets(3) ).to_s.should eq( "lo\n" )
( io.gets(3) ).to_s.should eq( "wor" )
( io.gets(3) ).to_s.should eq( "ld" )
( io.gets(3) ).should eq( nil )

puts "# io.cr:597 (024.cr)" # :nocode: :example:
io = IO::Memory.new "hello\nworld"
( io.gets('o') ).to_s.should eq( "hello" )
( io.gets('r') ).to_s.should eq( "\nwor" )
( io.gets('z') ).to_s.should eq( "ld" )
( io.gets('w') ).should eq( nil )

puts "# io.cr:611 (025.cr)" # :nocode: :example:
io = IO::Memory.new "hello\nworld"
( io.gets('o', 3) ).to_s.should eq( "hel" )
( io.gets('r', 10) ).to_s.should eq( "lo\nwor" )
( io.gets('z', 10) ).to_s.should eq( "ld" )
( io.gets('w', 10) ).should eq( nil )

puts "# io.cr:767 (026.cr)" # :nocode: :example:
io = IO::Memory.new "hello\nworld"
( io.gets("wo") ).to_s.should eq( "hello\nwo" )
( io.gets("wo") ).to_s.should eq( "rld" )
( io.gets("wo") ).should eq( nil )

puts "# io.cr:820 (027.cr)" # :nocode: :example:
io = IO::Memory.new "hello world"
io.skip(6)
( io.gets ).to_s.should eq( "world" )
expect_raises(IO::EOFError) { io.skip(1) }

puts "# io.cr:846 (028.cr)" # :nocode: :example:
io = IO::Memory.new
io.write_byte 97_u8
( io.to_s ).to_s.should eq( "a" )

puts "# io.cr:864 (029.cr)" # :nocode: :example:
io = IO::Memory.new
io.write_bytes(0x01020304, IO::ByteFormat::LittleEndian)
io.rewind
( io.gets(4) ).to_s.should eq( "\u{4}\u{3}\u{2}\u{1}" )

puts "# io.cr:882 (030.cr)" # :nocode: :example:
io = IO::Memory.new
io.puts "\u{4}\u{3}\u{2}\u{1}"
io.rewind
( io.read_bytes(Int32, IO::ByteFormat::LittleEndian) ).should eq( 0x01020304 )

puts "# io.cr:896 (031.cr)" # :nocode: :example:
( STDIN.tty? ).should eq( true )
( IO::Memory.new.tty? ).should eq( false )

puts "# io.cr:908 (032.cr)" # :nocode: :example:
io = IO::Memory.new("hello\nworld")
io.each_line do |line|
  puts line.chomp.reverse
end

puts "# io.cr:931 (033.cr)" # :nocode: :example:
io = IO::Memory.new("hello\nworld")
iter = io.each_line
( iter.next ).to_s.should eq( "hello" )
( iter.next ).to_s.should eq( "world" )

puts "# io.cr:943 (034.cr)" # :nocode: :example:
io = IO::Memory.new("あめ")
io.each_char do |char|
  puts char
end

puts "# io.cr:964 (035.cr)" # :nocode: :example:
io = IO::Memory.new("あめ")
iter = io.each_char
( iter.next ).should eq( 'あ' )
( iter.next ).should eq( 'め' )

puts "# io.cr:976 (036.cr)" # :nocode: :example:
io = IO::Memory.new("aあ")
io.each_byte do |byte|
  puts byte
end

puts "# io.cr:999 (037.cr)" # :nocode: :example:
io = IO::Memory.new("aあ")
iter = io.each_byte
( iter.next ).should eq( 97 )
( iter.next ).should eq( 227 )
( iter.next ).should eq( 129 )
( iter.next ).should eq( 130 )

puts "# io.cr:1058 (038.cr)" # :nocode: :example:
File.write("testfile", "abc")

file = File.new("testfile")
( file.gets(3) ).to_s.should eq( "abc" )
file.seek(1, IO::Seek::Set)
( file.gets(2) ).to_s.should eq( "bc" )
file.seek(-1, IO::Seek::Current)
( file.gets(1) ).to_s.should eq( "c" )

puts "# io.cr:1077 (039.cr)" # :nocode: :example:
File.write("testfile", "hello")

file = File.new("testfile")
( file.pos ).should eq( 0 )
( file.gets(2) ).to_s.should eq( "he" )
( file.pos ).should eq( 2 )

puts "# io.cr:1094 (040.cr)" # :nocode: :example:
File.write("testfile", "hello")

file = File.new("testfile")
file.pos = 3
( file.gets_to_end ).to_s.should eq( "lo" )

puts "# io.cr:1122 (041.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
io2 = IO::Memory.new

IO.copy io, io2

( io2.to_s ).to_s.should eq( "hello" )

puts "# io.cr:1142 (042.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
io2 = IO::Memory.new

IO.copy io, io2, 3

( io2.to_s ).to_s.should eq( "hel" )

