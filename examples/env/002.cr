# env.cr:101
ENV.each do |key, value|
  puts "#{key} => #{value}"
end
