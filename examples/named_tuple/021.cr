# named_tuple.cr:428
tuple = {name: "Crystal", year: 2011}
tuple.each_with_index do |key, value, i|
  puts "#{i + 1}) #{key} = #{value}"
end
