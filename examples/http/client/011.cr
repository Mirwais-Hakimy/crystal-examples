# http/client.cr:233
require "http/client"
client = HTTP::Client.new("example.org")
client.read_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end
