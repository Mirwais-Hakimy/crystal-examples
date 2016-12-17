# http/client.cr:346
require "http/client"
client = HTTP::Client.new("www.example.com")
response = client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!")
response.body #=> "..."
