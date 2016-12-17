# uri.cr:89
require "uri"
URI.parse("http://admin:password@foo.com").password # => "password"
