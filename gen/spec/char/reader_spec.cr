require "spec"
require "char/reader"
it "char/reader.cr" do
puts # :nocode:

puts "# char/reader.cr:22 (001.cr)" # :nocode: :example:
reader = Char::Reader.new("ab")
( reader.current_char ).should eq( 'a' )
reader.next_char
( reader.current_char ).should eq( 'b' )

puts "# char/reader.cr:32 (002.cr)" # :nocode: :example:
reader = Char::Reader.new("aé")
( reader.current_char_width ).should eq( 1 )
reader.next_char
( reader.current_char_width ).should eq( 2 )

puts "# char/reader.cr:42 (003.cr)" # :nocode: :example:
reader = Char::Reader.new("ab")
( reader.pos ).should eq( 0 )
reader.next_char
( reader.pos ).should eq( 1 )

puts "# char/reader.cr:80 (004.cr)" # :nocode: :example:
reader = Char::Reader.new("a")
( reader.has_next? ).should eq( true )
( reader.peek_next_char ).should eq( '\0' )

puts "# char/reader.cr:93 (005.cr)" # :nocode: :example:
reader = Char::Reader.new("ab")
( reader.next_char ).should eq( 'b' )

puts "# char/reader.cr:111 (006.cr)" # :nocode: :example:
reader = Char::Reader.new("ab")
( reader.peek_next_char ).should eq( 'b' )
( reader.current_char ).should eq( 'a' )

puts "# char/reader.cr:148 (007.cr)" # :nocode: :example:
reader = Char::Reader.new("abc")
reader.next_char
reader.next_char
reader.pos = 0
( reader.current_char ).should eq( 'a' )

puts "# char/reader.cr:167 (008.cr)" # :nocode: :example:
reader = Char::Reader.new("abc")
reader.next_char
reader.each do |c|
  puts c.upcase
end


end
