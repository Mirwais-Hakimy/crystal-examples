# char/reader.cr:148
require "char/reader"
reader = Char::Reader.new("abc")
reader.next_char
reader.next_char
reader.pos = 0
reader.current_char # => 'a'
