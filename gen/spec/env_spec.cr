require "spec"

it "env.cr" do
puts # :nocode:

puts "# env.cr:7 (001.cr)" # :nocode: :example:
# Set env var PORT to a default if not already set
ENV["PORT"] ||= "5000"
# Later use that env var.
puts ENV["PORT"].to_i

puts "# env.cr:101 (002.cr)" # :nocode: :example:
ENV.each do |key, value|
  puts "#{key} => #{value}"
end


end
