# http/client.cr:34
require "http/client"

HTTP::Client.get("http://www.example.com") do |response|
  response.status_code  # => 200
  response.body_io.gets # => "<!doctype html>"
end
