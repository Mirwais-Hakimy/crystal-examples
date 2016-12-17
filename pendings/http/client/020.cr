# http/client.cr:371
require "http/client"
HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-agent" => "AwesomeApp"}, body: "Hello!") do |response|
  response.body_io.gets #=> "..."
end
