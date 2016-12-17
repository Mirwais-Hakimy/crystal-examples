# http/client.cr:523
require "http/client"
client = HTTP::Client.new "www.example.com"
client.exec(HTTP::Request.new("GET", "/")) do |response|
  response.body_io.gets # => "..."
end
