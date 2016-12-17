# http/cookie.cr:179
require "http/cookie"
response = HTTP::Client::Response.new(200)
response.cookies["foo"] = HTTP::Cookie.new("foo", "bar", "/admin", Time.now + 12.hours, secure: true)
