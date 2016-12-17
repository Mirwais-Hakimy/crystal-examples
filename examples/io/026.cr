# io.cr:767
io = IO::Memory.new "hello\nworld"
io.gets("wo") # => "hello\nwo"
io.gets("wo") # => "rld"
io.gets("wo") # => nil
