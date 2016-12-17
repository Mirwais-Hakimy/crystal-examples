# http/cookie.cr:167
require "http/cookie"
request = HTTP::Request.new "GET", "/"
request.cookies["foo"] = "bar"
