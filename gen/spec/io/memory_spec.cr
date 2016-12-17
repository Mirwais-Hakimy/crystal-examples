require "spec"

it "io/memory.cr" do
puts # :nocode:

puts "# io/memory.cr:17 (001.cr)" # :nocode: :example:
io = IO::Memory.new
slice = Bytes.new(1)
( io.pos ).should eq( 0 )
( io.read(slice) ).should eq( 0 )
( slice ).should eq( Bytes[0] )

puts "# io/memory.cr:41 (002.cr)" # :nocode: :example:
slice = Slice.new(6) { |i| ('a'.ord + i).to_u8 }
io = IO::Memory.new slice, writeable: false
( io.pos ).should eq( 0 )
( io.read(slice) ).should eq( 6 )
( String.new(slice) ).to_s.should eq( "abcdef" )

puts "# io/memory.cr:62 (003.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
( io.pos ).should eq( 0 )
( io.gets(2) ).to_s.should eq( "he" )
expect_raises(IO::Error) { io.print "hi" }

puts "# io/memory.cr:235 (004.cr)" # :nocode: :example:
io = IO::Memory.new
io << "abc"
io.rewind
( io.gets(1) ).to_s.should eq( "a" )
io.clear
( io.pos ).should eq( 0 )
( io.gets_to_end ).to_s.should eq( "" )

io = IO::Memory.new "hello"
expect_raises(IO::Error) { io.clear }

puts "# io/memory.cr:256 (005.cr)" # :nocode: :example:
io = IO::Memory.new
( io.empty? ).should eq( true )
io.print "hello"
( io.empty? ).should eq( false )

puts "# io/memory.cr:268 (006.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
( io.gets(2) ).to_s.should eq( "he" )
io.rewind
( io.gets(2) ).to_s.should eq( "he" )

puts "# io/memory.cr:281 (007.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
( io.size ).should eq( 5 )

puts "# io/memory.cr:291 (008.cr)" # :nocode: :example:
io = IO::Memory.new("abcdef")
( io.gets(3) ).to_s.should eq( "abc" )
io.seek(1, IO::Seek::Set)
( io.gets(2) ).to_s.should eq( "bc" )
io.seek(-1, IO::Seek::Current)
( io.gets(1) ).to_s.should eq( "c" )

puts "# io/memory.cr:316 (009.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
( io.pos ).should eq( 0 )
( io.gets(2) ).to_s.should eq( "he" )
( io.pos ).should eq( 2 )

puts "# io/memory.cr:328 (010.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
io.pos = 3
( io.gets ).to_s.should eq( "lo" )

puts "# io/memory.cr:372 (011.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
io.close
expect_raises(IO::Error) { io.gets_to_end }

puts "# io/memory.cr:383 (012.cr)" # :nocode: :example:
io = IO::Memory.new "hello"
( io.closed? ).should eq( false )
io.close
( io.closed? ).should eq( true )

puts "# io/memory.cr:395 (013.cr)" # :nocode: :example:
io = IO::Memory.new
io.print 1, 2, 3
( io.to_s ).to_s.should eq( "123" )

puts "# io/memory.cr:406 (014.cr)" # :nocode: :example:
io = IO::Memory.new
io.print "hello"

( io.to_slice ).should eq( Bytes[104, 101, 108, 108, 111] )


end
