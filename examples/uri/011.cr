# uri.cr:124
require "uri"
URI.parse("http://[::1]/bar").hostname # => "::1"
URI.parse("http://[::1]/bar").host     # => "[::1]"
