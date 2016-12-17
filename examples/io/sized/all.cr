# io/sized.cr: 1 examples
require "io/sized"

# io/sized.cr:3 (001.cr)
io = IO::Memory.new "abcde"
sized = IO::Sized.new(io, read_size: 3)

sized.gets_to_end # => "abc"
sized.gets_to_end # => ""
io.gets_to_end    # => "de"
