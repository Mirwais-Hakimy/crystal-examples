# ecr.cr:29
require "ecr"

class Greeter
  def initialize(@name : String)
  end

  ECR.def_to_s "greeter.ecr"
end

Greeter.new("John").to_s # => "Greetings, John!\n"
