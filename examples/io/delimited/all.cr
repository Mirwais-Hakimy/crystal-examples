# io/delimited.cr: 1 examples
require "io/delimited"

# io/delimited.cr:6 (001.cr)
io = IO::Memory.new "abc||123"
delimited = IO::Delimited.new(io, read_delimiter: "||")

delimited.gets_to_end # => "abc"
delimited.gets_to_end # => ""
io.gets_to_end        # => "123"
