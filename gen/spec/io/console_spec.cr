require "spec"
require "io/console"
it "io/console.cr" do
puts # :nocode:

puts "# io/console.cr:10 (001.cr)" # :nocode: :example:
print "Enter password: "
password = STDIN.noecho &.gets.try &.chomp
puts


end
