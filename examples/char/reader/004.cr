# char/reader.cr:80
require "char/reader"
reader = Char::Reader.new("a")
reader.has_next?      # => true
reader.peek_next_char # => '\0'
