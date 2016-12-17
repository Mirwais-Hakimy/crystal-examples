# http/formdata.cr:100
require "http"
headers = HTTP::Headers{"Content-Type" => "multipart/form-data; boundary=aA40"}
body = "--aA40\r\nContent-Disposition: form-data; name=\"field1\"\r\n\r\nfield data\r\n--aA40--"
request = HTTP::Request.new("POST", "/", headers, body)

HTTP::FormData.parse(request) do |part|
  part.name             # => "field1"
  part.body.gets_to_end # => "field data"
end
