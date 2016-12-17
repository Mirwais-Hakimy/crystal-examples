# io/stapled.cr:5
require "io/stapled"
io = IO::Stapled.new(*IO.pipe)
io.puts "linus"
io.gets # => "linus"
