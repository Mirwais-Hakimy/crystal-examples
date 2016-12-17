# char/reader.cr:93
require "char/reader"
reader = Char::Reader.new("ab")
reader.next_char # => 'b'
