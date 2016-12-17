# http/client.cr:151
require "http/client"
uri = URI.parse("https://secure.example.com")
client = HTTP::Client.new(uri)

client.tls? # => #<OpenSSL::SSL::Context::Client>
client.get("/")
