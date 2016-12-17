# http/client.cr:263
require "http/client"
client = HTTP::Client.new("example.org")
client.connect_timeout = 1.5
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end
