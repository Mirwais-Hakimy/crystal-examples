# uri.cr:69
require "uri"
URI.parse("http://foo.com/bar?q=1").query # => "q=1"
