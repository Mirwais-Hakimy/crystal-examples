# ecr/macros.cr:94
require "ecr/macros"
String.build do |io|
  io << "Hello "
  io << name
  io << '!'
end
