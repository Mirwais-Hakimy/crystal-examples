# http/client.cr:618
require "http/client"
client = HTTP::Client.new "www.example.com"
client.exec("GET", "/") do |response|
  response.body_io.gets # => "..."
end
