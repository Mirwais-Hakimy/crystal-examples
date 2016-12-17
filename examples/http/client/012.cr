# http/client.cr:248
require "http/client"
client = HTTP::Client.new("example.org")
client.read_timeout = 5.minutes
begin
  response = client.get("/")
rescue IO::Timeout
  puts "Timeout!"
end
