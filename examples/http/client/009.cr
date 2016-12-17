# http/client.cr:178
require "http/client"
uri = URI.parse("https://secure.example.com")
HTTP::Client.new(uri) do |client|
  client.tls? # => #<OpenSSL::SSL::Context::Client>
  client.get("/")
end
