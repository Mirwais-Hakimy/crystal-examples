# uri.cr:335
require "uri"
uri = URI.parse "http://admin:password@foo.com"
uri.userinfo # => "admin:password"
