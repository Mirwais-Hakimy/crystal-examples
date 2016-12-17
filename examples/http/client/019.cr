# http/client.cr:358
require "http/client"
client = HTTP::Client.new("www.example.com")
client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!") do |response|
  response.body_io.gets #=> "..."
end
