# http/multipart.cr:34
require "http"
HTTP::Multipart.parse_boundary("multipart/mixed; boundary=\"abcde\"") # => "abcde"
