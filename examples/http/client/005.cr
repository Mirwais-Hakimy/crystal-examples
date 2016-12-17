# http/client.cr:74
require "http/client"
client = HTTP::Client.new "www.example.com"
client.host # => "www.example.com"
