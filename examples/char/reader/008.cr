# char/reader.cr:167
require "char/reader"
reader = Char::Reader.new("abc")
reader.next_char
reader.each do |c|
  puts c.upcase
end
