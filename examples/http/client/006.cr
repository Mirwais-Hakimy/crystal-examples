# http/client.cr:82
require "http/client"
client = HTTP::Client.new "www.example.com"
client.port # => 80
