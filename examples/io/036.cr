# io.cr:976
io = IO::Memory.new("aあ")
io.each_byte do |byte|
  puts byte
end
