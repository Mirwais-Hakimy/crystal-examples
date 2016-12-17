# ecr.cr:53
require "ecr"

class Greeter
  def initialize(@name : String | Nil)
  end

  ECR.def_to_s "greeter.ecr"
end

Greeter.new(nil).to_s    # => "Greetings!\n"
Greeter.new("Jill").to_s # => "Greetings, Jill!\n"
