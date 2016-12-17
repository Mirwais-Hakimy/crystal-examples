# ecr/macros.cr:26
class Greeting
  def to_s(io)
    io << "Hello "
    io << @name
    io << "!"
  end
end
