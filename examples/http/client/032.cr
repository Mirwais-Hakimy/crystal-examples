# http/client.cr:633
require "http/client"
response = HTTP::Client.exec "GET", "http://www.example.com"
response.body # => "..."
