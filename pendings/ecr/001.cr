# ecr.cr:17
require "ecr"

class Greeting
  def initialize(@name : String)
  end

  ECR.def_to_s "greeting.ecr"
end

# greeting.ecr
Greeting, <%= @name %>!

Greeting.new("John").to_s #=> Greeting, John!
