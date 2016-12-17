# http/client.cr:278
require "http/client"
client = HTTP::Client.new("example.org")
client.connect_timeout = 5.minutes
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end
