# http/formdata.cr: 6 examples
require "http"

# http/formdata.cr:11 (001.cr)
require "http"
require "tempfile"

server = HTTP::Server.new do |context|
  name = nil
  file = nil
  HTTP::FormData.parse(context.request) do |part|
    case part.name
    when "name"
      name = part.body.gets_to_end
    when "file"
      file = File.tempfile("upload") do |file|
        IO.copy(part.body, file)
      end
    end
  end

  unless name && file
    context.response.status_code = 400
    next
  end

  context.response << file.path
end

server.bind_tcp 8085
server.listen

# http/formdata.cr:51 (002.cr)
# pending by 'file:pendings/http/formdata/002.cr'
# require "http"
# 
# IO.pipe do |reader, writer|
#   channel = Channel(String).new(1)
# 
#   spawn do
#     HTTP::FormData.build(writer) do |formdata|
#       channel.send(formdata.content_type)
# 
#       formdata.field("name", "foo")
#       File.open("foo.png") do |file|
#         metadata = HTTP::FormData::FileMetadata.new(filename: "foo.png")
#         headers = HTTP::Headers{"Content-Type" => "image/png"}
#         formdata.file("file", file, metadata, headers)
#       end
#     end
# 
#     writer.close
#   end
# 
#   headers = HTTP::Headers{"Content-Type" => channel.receive}
#   response = HTTP::Client.post("http://localhost:8085/", body: reader, headers: headers)
# 
#   puts "Response code #{response.status_code}"
#   puts "File path: #{response.body}"
# end

# http/formdata.cr:82 (003.cr)
form_data = "--aA40\r\nContent-Disposition: form-data; name=\"field1\"\r\n\r\nfield data\r\n--aA40--"
HTTP::FormData.parse(IO::Memory.new(form_data), "aA40") do |part|
  part.name             # => "field1"
  part.body.gets_to_end # => "field data"
end

# http/formdata.cr:100 (004.cr)
headers = HTTP::Headers{"Content-Type" => "multipart/form-data; boundary=aA40"}
body = "--aA40\r\nContent-Disposition: form-data; name=\"field1\"\r\n\r\nfield data\r\n--aA40--"
request = HTTP::Request.new("POST", "/", headers, body)

HTTP::FormData.parse(request) do |part|
  part.name             # => "field1"
  part.body.gets_to_end # => "field data"
end

# http/formdata.cr:172 (005.cr)
io = IO::Memory.new
HTTP::FormData.build(io, "boundary") do |builder|
  builder.field("foo", "bar")
end
io.to_s # => "--boundary\r\nContent-Disposition: form-data; name=\"foo\"\r\n\r\nbar\r\n--boundary--"

# http/formdata.cr:192 (006.cr)
io = IO::Memory.new
response = HTTP::Server::Response.new io
HTTP::FormData.build(response, "boundary") do |builder|
  builder.field("foo", "bar")
end
response.close

response.headers["Content-Type"] # => "multipart/form-data; boundary=\"boundary\""
io.to_s                          # => "HTTP/1.1 200 OK\r\nContent-Type: multipart/form-data; boundary=\"boundary\"\r\nContent-Length: 75\r\n\r\n--boundary\r\nContent-Disposition: form-data; name=\"foo\"\r\n\r\nbar\r\n--boundary--"
