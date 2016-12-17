# http/client.cr:360
require "http/client"
response = HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-agent" => "AwesomeApp"}, body: "Hello!")
response.body #=> "..."
