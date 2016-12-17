# http/headers.cr: 1 examples
require "http/headers"

# http/headers.cr:77 (001.cr)
headers = HTTP::Headers{"Connection" => "keep-alive, Upgrade"}
headers.includes_word?("Connection", "Upgrade") # => true
