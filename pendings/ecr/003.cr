# ecr.cr:48
class Greeting
  @names : Array(String)

  def initialize(*names)
   @names = names.to_a
  end

  ECR.def_to_s "greeting.ecr"
end

# greeting.ecr
<%- @names.each do |name| -%>
Hi, <%= name %>!
<%- end -%>

Greeting.new("John", "Zoe", "Ben").to_s
#=> Hi, John!
#=> Hi, Zoe!
#=> Hi, Ben!
