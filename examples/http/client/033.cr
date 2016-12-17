# http/client.cr:647
require "http/client"
HTTP::Client.exec("GET", "http://www.example.com") do |response|
  response.body_io.gets # => "..."
end
