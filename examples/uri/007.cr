# uri.cr:79
require "uri"
URI.parse("http://admin:password@foo.com").user # => "admin"
