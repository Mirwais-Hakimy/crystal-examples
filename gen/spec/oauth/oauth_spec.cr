require "spec"
require "http/client"
require "oauth"
it "oauth/oauth.cr" do
puts # :nocode:

puts "# oauth/oauth.cr:9 (001.cr)" # :nocode: :example:
# require "http/client"
# require "oauth"

token = "some_token"
secret = "some_secret"
consumer_key = "some_consumer_key"
consumer_secret = "some_consumer_secret"

# Create an HTTP::Client as usual
client = HTTP::Client.new("api.example.com", tls: true)

# Prepare it for using OAuth authentication
OAuth.authenticate(client, token, secret, consumer_key, consumer_secret)

# Execute requests as usual: they will be authenticated
client.get("/some_path")


end
