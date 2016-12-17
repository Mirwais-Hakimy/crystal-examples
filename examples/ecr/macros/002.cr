# ecr/macros.cr:26
require "ecr/macros"
class Greeting
  def to_s(io)
    io << "Hello "
    io << @name
    io << '!'
  end
end
