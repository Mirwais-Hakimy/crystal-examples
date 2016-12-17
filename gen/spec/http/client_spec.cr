require "spec"
require "http/client"
it "http/client.cr" do
puts # :nocode:

puts "# http/client.cr:8 (001.cr)" # :nocode: :example:
# require "http/client"

response = HTTP::Client.get "http://www.example.com"
( response.status_code ).should eq( 200 )
( response.body.lines.first ).to_s.should eq( "<!doctype html>" )

puts "# http/client.cr:21 (002.cr)" # :nocode: :example:
# require "http/client"

( params = HTTP::Params.encode({"author" => "John Doe", "offset" => "20"}) ).should eq( author=John+Doe&offset=20 )
response = HTTP::Client.get "http://www.example.com?" + params
( response.status_code ).should eq( 200 )

puts "# http/client.cr:34 (003.cr)" # :nocode: :example:
# require "http/client"

HTTP::Client.get("http://www.example.com") do |response|
(   response.status_code ).should eq( 200 )
(   response.body_io.gets ).to_s.should eq( "<!doctype html>" )
end

puts "# http/client.cr:47 (004.cr)" # :nocode: :example:
# require "http/client"

client = HTTP::Client.new "www.example.com"
response = client.get "/"
( response.status_code ).should eq( 200 )
( response.body.lines.first ).to_s.should eq( "<!doctype html>" )
client.close

puts "# http/client.cr:74 (005.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
( client.host ).to_s.should eq( "www.example.com" )

puts "# http/client.cr:82 (006.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
( client.port ).should eq( 80 )

puts "# http/client.cr:92 (007.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com", tls: true
( client.tls ).class.to_s.should eq( "OpenSSL::SSL::Context::Client" )

puts "# http/client.cr:151 (008.cr)" # :nocode: :example:
uri = URI.parse("https://secure.example.com")
client = HTTP::Client.new(uri)

( client.tls? ).class.to_s.should eq( "OpenSSL::SSL::Context::Client" )
client.get("/")

puts "# http/client.cr:178 (009.cr)" # :nocode: :example:
uri = URI.parse("https://secure.example.com")
HTTP::Client.new(uri) do |client|
(   client.tls? ).class.to_s.should eq( "OpenSSL::SSL::Context::Client" )
  client.get("/")
end

puts "# http/client.cr:208 (010.cr)" # :nocode: :example:
HTTP::Client.new("www.example.com") do |client|
  client.get "/"
end

puts "# http/client.cr:233 (011.cr)" # :nocode: :example:
client = HTTP::Client.new("example.org")
client.read_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

puts "# http/client.cr:248 (012.cr)" # :nocode: :example:
client = HTTP::Client.new("example.org")
client.read_timeout = 5.minutes
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

puts "# http/client.cr:263 (013.cr)" # :nocode: :example:
client = HTTP::Client.new("example.org")
client.connect_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

puts "# http/client.cr:278 (014.cr)" # :nocode: :example:
client = HTTP::Client.new("example.org")
client.connect_timeout = 5.minutes
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

puts "# http/client.cr:295 (015.cr)" # :nocode: :example:
client = HTTP::Client.new("example.org")
client.dns_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

puts "# http/client.cr:312 (016.cr)" # :nocode: :example:
client = HTTP::Client.new("example.org")
client.dns_timeout = 1.5.seconds
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

puts "# http/client.cr:330 (017.cr)" # :nocode: :example:
client = HTTP::Client.new("www.example.com")
client.before_request do |request|
  request.headers["Authorization"] = "XYZ123"
end
client.get "/"

puts "# http/client.cr:346 (018.cr)" # :nocode: :example:
client = HTTP::Client.new("www.example.com")
response = client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!")
( response.body ).to_s.should eq( "..." )

puts "# http/client.cr:358 (019.cr)" # :nocode: :example:
client = HTTP::Client.new("www.example.com")
client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!") do |response|
(   response.body_io.gets ).to_s.should eq( "..." )
end

puts "# http/client.cr:373 (020.cr)" # :nocode: :example:
response = HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!")
( response.body ).to_s.should eq( "..." )

puts "# http/client.cr:384 (021.cr)" # :nocode: :example:
HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!") do |response|
(   response.body_io.gets ).to_s.should eq( "..." )
end

puts "# http/client.cr:398 (022.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
response = client.{{method.id}} "/", form: "foo=bar"

puts "# http/client.cr:412 (023.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
client.{{method.id}}("/", form: "foo=bar") do |response|
  response.body_io.gets
end

puts "# http/client.cr:429 (024.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
response = client.{{method.id}} "/", form: {"foo" => "bar"}

puts "# http/client.cr:442 (025.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
client.{{method.id}}("/", form: {"foo" => "bar"}) do |response|
  response.body_io.gets
end

puts "# http/client.cr:458 (026.cr)" # :nocode: :example:
response = HTTP::Client.{{method.id}} "http://www.example.com", form: "foo=bar"

puts "# http/client.cr:471 (027.cr)" # :nocode: :example:
HTTP::Client.{{method.id}}("http://www.example.com", form: "foo=bar") do |response|
  response.body_io.gets
end

puts "# http/client.cr:488 (028.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
response = client.exec HTTP::Request.new("GET", "/")
( response.body ).to_s.should eq( "..." )

puts "# http/client.cr:523 (029.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
client.exec(HTTP::Request.new("GET", "/")) do |response|
(   response.body_io.gets ).to_s.should eq( "..." )
end

puts "# http/client.cr:606 (030.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
response = client.exec "GET", "/"
( response.body ).to_s.should eq( "..." )

puts "# http/client.cr:618 (031.cr)" # :nocode: :example:
client = HTTP::Client.new "www.example.com"
client.exec("GET", "/") do |response|
(   response.body_io.gets ).to_s.should eq( "..." )
end

puts "# http/client.cr:633 (032.cr)" # :nocode: :example:
response = HTTP::Client.exec "GET", "http://www.example.com"
( response.body ).to_s.should eq( "..." )

puts "# http/client.cr:647 (033.cr)" # :nocode: :example:
HTTP::Client.exec("GET", "http://www.example.com") do |response|
(   response.body_io.gets ).to_s.should eq( "..." )
end


end
