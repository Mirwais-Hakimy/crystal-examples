# io/stapled.cr: 1 examples
require "io/stapled"

# io/stapled.cr:5 (001.cr)
io = IO::Stapled.new(*IO.pipe)
io.puts "linus"
io.gets # => "linus"
