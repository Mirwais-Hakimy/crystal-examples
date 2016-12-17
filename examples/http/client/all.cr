# http/client.cr: 33 examples
require "http/client"

# http/client.cr:8 (001.cr)
require "http/client"

response = HTTP::Client.get "http://www.example.com"
response.status_code      # => 200
response.body.lines.first # => "<!doctype html>"

# http/client.cr:21 (002.cr)
require "http/client"

params = HTTP::Params.encode({"author" => "John Doe", "offset" => "20"}) # => author=John+Doe&offset=20
response = HTTP::Client.get "http://www.example.com?" + params
response.status_code # => 200

# http/client.cr:34 (003.cr)
require "http/client"

HTTP::Client.get("http://www.example.com") do |response|
  response.status_code  # => 200
  response.body_io.gets # => "<!doctype html>"
end

# http/client.cr:47 (004.cr)
require "http/client"

client = HTTP::Client.new "www.example.com"
response = client.get "/"
response.status_code      # => 200
response.body.lines.first # => "<!doctype html>"
client.close

# http/client.cr:74 (005.cr)
client = HTTP::Client.new "www.example.com"
client.host # => "www.example.com"

# http/client.cr:82 (006.cr)
client = HTTP::Client.new "www.example.com"
client.port # => 80

# http/client.cr:92 (007.cr)
client = HTTP::Client.new "www.example.com", tls: true
client.tls # => #<OpenSSL::SSL::Context::Client ...>

# http/client.cr:151 (008.cr)
uri = URI.parse("https://secure.example.com")
client = HTTP::Client.new(uri)

client.tls? # => #<OpenSSL::SSL::Context::Client>
client.get("/")

# http/client.cr:178 (009.cr)
uri = URI.parse("https://secure.example.com")
HTTP::Client.new(uri) do |client|
  client.tls? # => #<OpenSSL::SSL::Context::Client>
  client.get("/")
end

# http/client.cr:208 (010.cr)
HTTP::Client.new("www.example.com") do |client|
  client.get "/"
end

# http/client.cr:233 (011.cr)
client = HTTP::Client.new("example.org")
client.read_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

# http/client.cr:248 (012.cr)
client = HTTP::Client.new("example.org")
client.read_timeout = 5.minutes
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

# http/client.cr:263 (013.cr)
client = HTTP::Client.new("example.org")
client.connect_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

# http/client.cr:278 (014.cr)
client = HTTP::Client.new("example.org")
client.connect_timeout = 5.minutes
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

# http/client.cr:295 (015.cr)
client = HTTP::Client.new("example.org")
client.dns_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

# http/client.cr:312 (016.cr)
client = HTTP::Client.new("example.org")
client.dns_timeout = 1.5.seconds
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end

# http/client.cr:330 (017.cr)
client = HTTP::Client.new("www.example.com")
client.before_request do |request|
  request.headers["Authorization"] = "XYZ123"
end
client.get "/"

# http/client.cr:346 (018.cr)
client = HTTP::Client.new("www.example.com")
response = client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!")
response.body #=> "..."

# http/client.cr:358 (019.cr)
client = HTTP::Client.new("www.example.com")
client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!") do |response|
  response.body_io.gets #=> "..."
end

# http/client.cr:373 (020.cr)
response = HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!")
response.body #=> "..."

# http/client.cr:384 (021.cr)
HTTP::Client.{{method.id}}("/", headers: HTTP::Headers{"User-Agent" => "AwesomeApp"}, body: "Hello!") do |response|
  response.body_io.gets #=> "..."
end

# http/client.cr:398 (022.cr)
client = HTTP::Client.new "www.example.com"
response = client.{{method.id}} "/", form: "foo=bar"

# http/client.cr:412 (023.cr)
client = HTTP::Client.new "www.example.com"
client.{{method.id}}("/", form: "foo=bar") do |response|
  response.body_io.gets
end

# http/client.cr:429 (024.cr)
client = HTTP::Client.new "www.example.com"
response = client.{{method.id}} "/", form: {"foo" => "bar"}

# http/client.cr:442 (025.cr)
client = HTTP::Client.new "www.example.com"
client.{{method.id}}("/", form: {"foo" => "bar"}) do |response|
  response.body_io.gets
end

# http/client.cr:458 (026.cr)
response = HTTP::Client.{{method.id}} "http://www.example.com", form: "foo=bar"

# http/client.cr:471 (027.cr)
HTTP::Client.{{method.id}}("http://www.example.com", form: "foo=bar") do |response|
  response.body_io.gets
end

# http/client.cr:488 (028.cr)
client = HTTP::Client.new "www.example.com"
response = client.exec HTTP::Request.new("GET", "/")
response.body # => "..."

# http/client.cr:523 (029.cr)
client = HTTP::Client.new "www.example.com"
client.exec(HTTP::Request.new("GET", "/")) do |response|
  response.body_io.gets # => "..."
end

# http/client.cr:606 (030.cr)
client = HTTP::Client.new "www.example.com"
response = client.exec "GET", "/"
response.body # => "..."

# http/client.cr:618 (031.cr)
client = HTTP::Client.new "www.example.com"
client.exec("GET", "/") do |response|
  response.body_io.gets # => "..."
end

# http/client.cr:633 (032.cr)
response = HTTP::Client.exec "GET", "http://www.example.com"
response.body # => "..."

# http/client.cr:647 (033.cr)
HTTP::Client.exec("GET", "http://www.example.com") do |response|
  response.body_io.gets # => "..."
end
