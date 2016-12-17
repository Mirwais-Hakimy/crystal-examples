# http/cookie.cr:224
require "http/cookie"
response.cookies << HTTP::Cookie.new("foo", "bar", http_only: true)
