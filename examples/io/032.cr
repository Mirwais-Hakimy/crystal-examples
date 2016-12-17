# io.cr:908
io = IO::Memory.new("hello\nworld")
io.each_line do |line|
  puts line.chomp.reverse
end
