# uri.cr:509
require "uri"
URI.default_port "http"  # => 80
URI.default_port "ponzi" # => nil
