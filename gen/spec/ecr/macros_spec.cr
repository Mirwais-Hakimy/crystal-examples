require "spec"
require "ecr/macros"
puts "# ecr/macros.cr:10 (001.cr)" # :nocode: :example:
# pending by 'file:pendings/ecr/macros/001.cr' # :pending:
# require "ecr/macros"
# 
# class Greeting
#   def initialize(@name : String)
#   end
# 
#   ECR.def_to_s "greeting.ecr"
# end
# 
# Greeting.new("World").to_s # => "Hello World!"

puts "# ecr/macros.cr:26 (002.cr)" # :nocode: :example:
class Greeting
  def to_s(io)
    io << "Hello "
    io << @name
    io << '!'
  end
end

puts "# ecr/macros.cr:52 (003.cr)" # :nocode: :example:
# pending by 'file:pendings/ecr/macros/003.cr' # :pending:
# require "ecr/macros"
# 
# name = "World"
# 
# io = IO::Memory.new
# ECR.embed "greeting.ecr", io
# io.to_s # => "Hello World!"

puts "# ecr/macros.cr:64 (004.cr)" # :nocode: :example:
# pending by 'file:pendings/ecr/macros/004.cr' # :pending:
# io << "Hello "
# io << name
# io << '!'

puts "# ecr/macros.cr:83 (005.cr)" # :nocode: :example:
# pending by 'file:pendings/ecr/macros/005.cr' # :pending:
# require "ecr/macros"
# 
# name = "World"
# 
# rendered = ECR.render "greeting.ecr"
# rendered # => "Hello World!"

puts "# ecr/macros.cr:94 (006.cr)" # :nocode: :example:
# pending by 'file:pendings/ecr/macros/006.cr' # :pending:
# String.build do |io|
#   io << "Hello "
#   io << name
#   io << '!'
# end

