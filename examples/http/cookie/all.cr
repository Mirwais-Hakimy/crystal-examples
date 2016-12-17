# http/cookie.cr: 6 examples
require "http/cookie"

# http/cookie.cr:167 (001.cr)
request = HTTP::Request.new "GET", "/"
request.cookies["foo"] = "bar"

# http/cookie.cr:179 (002.cr)
response = HTTP::Client::Response.new(200)
response.cookies["foo"] = HTTP::Cookie.new("foo", "bar", "/admin", Time.now + 12.hours, secure: true)

# http/cookie.cr:193 (003.cr)
request.cookies["foo"].value # => "bar"

# http/cookie.cr:202 (004.cr)
request = HTTP::Request.new "GET", "/"
request.cookies["foo"]? # => nil
request.cookies["foo"] = "bar"
request.cookies["foo"]?.try &.value # > "bar"

# http/cookie.cr:214 (005.cr)
request.cookies.has_key?("foo") # => true

# http/cookie.cr:224 (006.cr)
response.cookies << HTTP::Cookie.new("foo", "bar", http_only: true)
