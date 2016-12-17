# char/reader.cr:111
require "char/reader"
reader = Char::Reader.new("ab")
reader.peek_next_char # => 'b'
reader.current_char   # => 'a'
