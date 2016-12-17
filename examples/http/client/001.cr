# http/client.cr:8
require "http/client"

response = HTTP::Client.get "http://www.example.com"
response.status_code      # => 200
response.body.lines.first # => "<!doctype html>"
