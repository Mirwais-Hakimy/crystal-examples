# http/client.cr:373
require "http/client"
response = HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!")
response.body #=> "..."
