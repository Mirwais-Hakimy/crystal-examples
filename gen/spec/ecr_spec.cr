require "spec"
require "ecr"
puts "# ecr.cr:23 (001.cr)" # :nocode: :example:
Greetings, <%= @name %>!

puts "# ecr.cr:29 (002.cr)" # :nocode: :example:
# require "ecr"

class Greeter
  def initialize(@name : String)
  end

  ECR.def_to_s "greeter.ecr"
end

( Greeter.new("John").to_s ).to_s.should eq( "Greetings, John!\n" )

puts "# ecr.cr:44 (003.cr)" # :nocode: :example:
# greeter.ecr
<%- if @name -%>
Greetings, <%= @name %>!
<%- else -%>
Greetings!
<%- end -%>

puts "# ecr.cr:53 (004.cr)" # :nocode: :example:
# require "ecr"

class Greeter
  def initialize(@name : String | Nil)
  end

  ECR.def_to_s "greeter.ecr"
end

( Greeter.new(nil).to_s ).to_s.should eq( "Greetings!\n" )
( Greeter.new("Jill").to_s ).to_s.should eq( "Greetings, Jill!\n" )

puts "# ecr.cr:69 (005.cr)" # :nocode: :example:
# greeter.ecr
<%- @names.each do |name| -%>
Hi, <%= name %>!
<%- end -%>

puts "# ecr.cr:76 (006.cr)" # :nocode: :example:
# require "ecr"

class Greeter
  @names : Array(String)

  def initialize(*names)
    @names = names.to_a
  end

  ECR.def_to_s "greeter.ecr"
end

( Greeter.new("John", "Zoe", "Ben").to_s ).to_s.should eq( "Hi, John!\nHi, Zoe!\nHi, Ben!\n" )

puts "# ecr.cr:94 (007.cr)" # :nocode: :example:
# demo.ecr
<%# Demonstrate use of ECR tag -%>
A valid ECR tag looks like this: <%%= foo %>

puts "# ecr.cr:100 (008.cr)" # :nocode: :example:
# require "ecr"
foo = 2
( ECR.render("demo.ecr") ).to_s.should eq( "A valid ECR tag looks like this: <%= foo %>\n" )

