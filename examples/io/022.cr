# io.cr:567
io = IO::Memory.new "hello\nworld\nfoo\n"
io.gets               # => "hello"
io.gets(chomp: false) # => "world\n"
io.gets               # => "foo"
io.gets               # => nil
