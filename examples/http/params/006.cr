# http/params.cr:145
require "http/params"
params = HTTP::Params.parse("email=john@example.org")
params["email"]              # => "john@example.org"
# params["non_existent_param"] # KeyError
