# uri.cr:49
require "uri"
URI.parse("http://foo.com:5432").port # => 5432
