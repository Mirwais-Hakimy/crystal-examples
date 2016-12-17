# io.cr:154
IO.pipe do |reader, writer|
  writer.puts "hello"
  writer.puts "world"
  reader.gets # => "hello"
  reader.gets # => "world"
end
