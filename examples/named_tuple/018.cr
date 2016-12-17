# named_tuple.cr:365
tuple = {name: "Crystal", year: 2011}
tuple.each do |key, value|
  puts "#{key} = #{value}"
end
