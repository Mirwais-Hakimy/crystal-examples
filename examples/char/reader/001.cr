# char/reader.cr:22
require "char/reader"
reader = Char::Reader.new("ab")
reader.current_char # => 'a'
reader.next_char
reader.current_char # => 'b'
