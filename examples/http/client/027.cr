# http/client.cr:471
require "http/client"
HTTP::Client.{{method.id}}("http://www.example.com", form: "foo=bar") do |response|
  response.body_io.gets
end
