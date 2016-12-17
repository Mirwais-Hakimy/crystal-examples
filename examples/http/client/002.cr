# http/client.cr:21
require "http/client"

params = HTTP::Params.encode({"author" => "John Doe", "offset" => "20"}) # => author=John+Doe&offset=20
response = HTTP::Client.get "http://www.example.com?" + params
response.status_code # => 200
