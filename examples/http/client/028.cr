# http/client.cr:488
require "http/client"
client = HTTP::Client.new "www.example.com"
response = client.exec HTTP::Request.new("GET", "/")
response.body # => "..."
