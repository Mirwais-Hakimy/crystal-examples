# io.cr:259
io = IO::Memory.new
io.puts 1, '-', "Crystal"
io.to_s # => "1\n-\nCrystal\n"
