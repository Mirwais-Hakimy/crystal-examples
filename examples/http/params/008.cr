# http/params.cr:166
require "http/params"
params.has_key?("email")   # => true
params.has_key?("garbage") # => false
