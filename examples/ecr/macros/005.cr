# ecr/macros.cr:83
require "ecr/macros"

name = "World"

rendered = ECR.render "greeting.ecr"
rendered # => "Hello World!"
