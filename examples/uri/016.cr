# uri.cr:276
require "uri"
# Escape URI path
URI.escape("/foo/file?(1).txt") do |byte|
  URI.unreserved?(byte) || byte.chr == '/'
end
# => "/foo/file%3F%281%29.txt"
