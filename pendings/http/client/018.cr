# http/client.cr:345
require "http/client"
client = HTTP::Client.new("www.example.com")
client.{{method.id}}("/", headers: HTTP::Headers{"User-agent" => "AwesomeApp"}, body: "Hello!") do |response|
  response.body_io.gets #=> "..."
end
