# http/params.cr:156
require "http/params"
params["email"]?              # => "john@example.org"
params["non_existent_param"]? # nil
