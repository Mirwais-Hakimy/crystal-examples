# char/reader.cr:42
require "char/reader"
reader = Char::Reader.new("ab")
reader.pos # => 0
reader.next_char
reader.pos # => 1
