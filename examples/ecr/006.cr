# ecr.cr:76
require "ecr"

class Greeter
  @names : Array(String)

  def initialize(*names)
    @names = names.to_a
  end

  ECR.def_to_s "greeter.ecr"
end

Greeter.new("John", "Zoe", "Ben").to_s # => "Hi, John!\nHi, Zoe!\nHi, Ben!\n"
