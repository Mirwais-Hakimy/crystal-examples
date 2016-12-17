# uri.cr:99
require "uri"
URI.parse("http://foo.com/bar#section1").fragment # => "section1"
