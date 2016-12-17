# uri.cr:109
require "uri"
URI.parse("mailto:alice@example.com").opaque # => "alice@example.com"
