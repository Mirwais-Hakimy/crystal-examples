# http/client.cr:333
require "http/client"
client = HTTP::Client.new("www.example.com")
response = client.{{method.id}}("/", headers: HTTP::Headers{"User-agent" => "AwesomeApp"}, body: "Hello!")
response.body #=> "..."
