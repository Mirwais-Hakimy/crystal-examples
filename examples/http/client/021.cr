# http/client.cr:384
require "http/client"
HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!") do |response|
  response.body_io.gets #=> "..."
end
