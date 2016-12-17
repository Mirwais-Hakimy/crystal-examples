# char/reader.cr: 8 examples
require "char/reader"

# char/reader.cr:22 (001.cr)
reader = Char::Reader.new("ab")
reader.current_char # => 'a'
reader.next_char
reader.current_char # => 'b'

# char/reader.cr:32 (002.cr)
reader = Char::Reader.new("aé")
reader.current_char_width # => 1
reader.next_char
reader.current_char_width # => 2

# char/reader.cr:42 (003.cr)
reader = Char::Reader.new("ab")
reader.pos # => 0
reader.next_char
reader.pos # => 1

# char/reader.cr:80 (004.cr)
reader = Char::Reader.new("a")
reader.has_next?      # => true
reader.peek_next_char # => '\0'

# char/reader.cr:93 (005.cr)
reader = Char::Reader.new("ab")
reader.next_char # => 'b'

# char/reader.cr:111 (006.cr)
reader = Char::Reader.new("ab")
reader.peek_next_char # => 'b'
reader.current_char   # => 'a'

# char/reader.cr:148 (007.cr)
reader = Char::Reader.new("abc")
reader.next_char
reader.next_char
reader.pos = 0
reader.current_char # => 'a'

# char/reader.cr:167 (008.cr)
reader = Char::Reader.new("abc")
reader.next_char
reader.each do |c|
  puts c.upcase
end
