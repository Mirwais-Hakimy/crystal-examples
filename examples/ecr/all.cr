# ecr.cr: 8 examples

# ecr.cr:23 (001.cr)
Greetings, <%= @name %>!

# ecr.cr:29 (002.cr)
require "ecr"

class Greeter
  def initialize(@name : String)
  end

  ECR.def_to_s "greeter.ecr"
end

Greeter.new("John").to_s # => "Greetings, John!\n"

# ecr.cr:44 (003.cr)
# greeter.ecr
<%- if @name -%>
Greetings, <%= @name %>!
<%- else -%>
Greetings!
<%- end -%>

# ecr.cr:53 (004.cr)
require "ecr"

class Greeter
  def initialize(@name : String | Nil)
  end

  ECR.def_to_s "greeter.ecr"
end

Greeter.new(nil).to_s    # => "Greetings!\n"
Greeter.new("Jill").to_s # => "Greetings, Jill!\n"

# ecr.cr:69 (005.cr)
# greeter.ecr
<%- @names.each do |name| -%>
Hi, <%= name %>!
<%- end -%>

# ecr.cr:76 (006.cr)
require "ecr"

class Greeter
  @names : Array(String)

  def initialize(*names)
    @names = names.to_a
  end

  ECR.def_to_s "greeter.ecr"
end

Greeter.new("John", "Zoe", "Ben").to_s # => "Hi, John!\nHi, Zoe!\nHi, Ben!\n"

# ecr.cr:94 (007.cr)
# demo.ecr
<%# Demonstrate use of ECR tag -%>
A valid ECR tag looks like this: <%%= foo %>

# ecr.cr:100 (008.cr)
require "ecr"
foo = 2
ECR.render("demo.ecr") # => "A valid ECR tag looks like this: <%= foo %>\n"
