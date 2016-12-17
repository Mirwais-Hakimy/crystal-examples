# http/client.cr:398
require "http/client"
client = HTTP::Client.new "www.example.com"
response = client.{{method.id}} "/", form: "foo=bar"
