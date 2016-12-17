# ecr/macros.cr:10
require "ecr/macros"

class Greeting
  def initialize(@name : String)
  end

  ECR.def_to_s "greeting.ecr"
end

Greeting.new("World").to_s # => "Hello World!"
