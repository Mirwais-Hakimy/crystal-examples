# uri.cr:28
require "uri"
URI.parse("http://foo.com").scheme           # => "http"
URI.parse("mailto:alice@example.com").scheme # => "mailto"
