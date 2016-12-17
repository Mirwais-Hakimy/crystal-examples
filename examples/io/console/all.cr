# io/console.cr: 1 examples
require "io/console"

# io/console.cr:10 (001.cr)
print "Enter password: "
password = STDIN.noecho &.gets.try &.chomp
puts
