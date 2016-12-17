# http/client.cr:330
require "http/client"
client = HTTP::Client.new("www.example.com")
client.before_request do |request|
  request.headers["Authorization"] = "XYZ123"
end
client.get "/"
