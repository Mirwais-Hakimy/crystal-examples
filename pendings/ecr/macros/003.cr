# ecr/macros.cr:52
require "ecr/macros"

name = "World"

io = IO::Memory.new
ECR.embed "greeting.ecr", io
io.to_s # => "Hello World!"
