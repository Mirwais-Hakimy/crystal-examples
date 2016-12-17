# http/headers.cr:77
require "http/headers"
headers = HTTP::Headers{"Connection" => "keep-alive, Upgrade"}
headers.includes_word?("Connection", "Upgrade") # => true
