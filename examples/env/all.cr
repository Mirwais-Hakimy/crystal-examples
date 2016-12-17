# env.cr: 2 examples

# env.cr:7 (001.cr)
# Set env var PORT to a default if not already set
ENV["PORT"] ||= "5000"
# Later use that env var.
puts ENV["PORT"].to_i

# env.cr:101 (002.cr)
ENV.each do |key, value|
  puts "#{key} => #{value}"
end
