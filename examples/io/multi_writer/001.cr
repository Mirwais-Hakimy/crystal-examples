# io/multi_writer.cr:3
require "io/multi_writer"
io1 = IO::Memory.new
io2 = IO::Memory.new
writer = IO::MultiWriter.new(io1, io2)
writer.puts "foo bar"
io1.to_s # => "foo bar\n"
io2.to_s # => "foo bar\n"
