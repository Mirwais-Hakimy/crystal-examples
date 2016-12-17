# http/params.cr:203
require "http/params"
params.fetch("email", "none@example.org")           # => "john@example.org"
params.fetch("non_existent_param", "default value") # => "default value"
