# http/client.cr:606
require "http/client"
client = HTTP::Client.new "www.example.com"
response = client.exec "GET", "/"
response.body # => "..."
