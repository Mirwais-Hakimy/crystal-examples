# http/client.cr:47
require "http/client"

client = HTTP::Client.new "www.example.com"
response = client.get "/"
response.status_code      # => 200
response.body.lines.first # => "<!doctype html>"
client.close
