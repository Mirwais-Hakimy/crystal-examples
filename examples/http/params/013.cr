# http/params.cr:214
require "http/params"
params.fetch("email") { raise "Email is missing" }              # raises "Email is missing"
params.fetch("non_existent_param") { "default computed value" } # => "default computed value"
