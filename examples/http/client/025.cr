# http/client.cr:442
require "http/client"
client = HTTP::Client.new "www.example.com"
client.{{method.id}}("/", form: {"foo" => "bar"}) do |response|
  response.body_io.gets
end
