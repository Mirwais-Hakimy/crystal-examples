# io.cr:234
io = IO::Memory.new
io.puts 1
io.puts "Crystal"
io.to_s # => "1\nCrystal\n"
