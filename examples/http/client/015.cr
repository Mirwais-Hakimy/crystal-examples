# http/client.cr:295
require "http/client"
client = HTTP::Client.new("example.org")
client.dns_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end
