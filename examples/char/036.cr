# char.cr:650
puts "'a'"
'a'.each_byte do |byte|
  puts byte
end
puts

puts "'あ'"
'あ'.each_byte do |byte|
  puts byte
end
