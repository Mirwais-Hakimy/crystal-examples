# http/cookie.cr:202
require "http/cookie"
request = HTTP::Request.new "GET", "/"
request.cookies["foo"]? # => nil
request.cookies["foo"] = "bar"
request.cookies["foo"]?.try &.value # > "bar"
