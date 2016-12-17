# oauth/oauth.cr: 1 examples
require "http/client"

# oauth/oauth.cr:9 (001.cr)
require "http/client"
require "oauth"

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
