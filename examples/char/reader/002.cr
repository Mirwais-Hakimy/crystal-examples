# char/reader.cr:32
require "char/reader"
reader = Char::Reader.new("aé")
reader.current_char_width # => 1
reader.next_char
reader.current_char_width # => 2
