# io.cr:943
io = IO::Memory.new("あめ")
io.each_char do |char|
  puts char
end
