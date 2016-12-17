# http/client.cr:92
require "http/client"
client = HTTP::Client.new "www.example.com", tls: true
client.tls # => #<OpenSSL::SSL::Context::Client ...>
