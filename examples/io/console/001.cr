# io/console.cr:10
require "io/console"
print "Enter password: "
password = STDIN.noecho &.gets.try &.chomp
puts
