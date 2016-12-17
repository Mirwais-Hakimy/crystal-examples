# ecr.cr:100
require "ecr"
foo = 2
ECR.render("demo.ecr") # => "A valid ECR tag looks like this: <%= foo %>\n"
