# http/params.cr:287
require "http/params"
params.set_all("comments", ["hello, world!", ":+1:"])
params.delete_all("comments") # => ["hello, world!", ":+1:"]
params.has_key?("comments")   # => false
