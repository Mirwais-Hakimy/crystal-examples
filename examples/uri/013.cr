# uri.cr:205
require "uri"

uri = URI.parse("http://crystal-lang.org") # => #<URI:0x1068a7e40 @scheme="http", @host="crystal-lang.org", ... >
uri.scheme                                 # => "http"
uri.host                                   # => "crystal-lang.org"
