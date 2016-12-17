# http/client.cr:208
require "http/client"
HTTP::Client.new("www.example.com") do |client|
  client.get "/"
end
