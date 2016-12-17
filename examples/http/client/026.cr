# http/client.cr:458
require "http/client"
response = HTTP::Client.{{method.id}} "http://www.example.com", form: "foo=bar"
