require "spec"
require "oauth"
it "oauth/consumer.cr" do
puts # :nocode:

puts "# oauth/consumer.cr:11 (001.cr)" # :nocode: :example:
# require "oauth"

consumer_key = "some_key"
consumer_secret = "some_secret"
oauth_callback = "http://some.callback"

# Create consumer, optionally pass custom URIs if needed,
# if the request, authorize or access_token URIs are not the standard ones
# (they can also be absolute URLs)
consumer = OAuth::Consumer.new("api.example.com", consumer_key, consumer_secret)

# Get a request token.
# We probably need to save this somewhere to get it back in the
# callback URL (saving token and secret should be enough)
request_token = consumer.get_request_token(oauth_callback)

# Build an authorize URI
authorize_uri = consumer.get_authorize_uri(request_token, oauth_callback)

# Redirect the user to `authorize_uri`...
#
# ...
#
# When http://some.callback is hit, once the user authorized the access,
# we resume our logic to finally get an access token. The callback URL
# should receive an `oauth_verifier` parameter that we need to use.
oauth_verifier = request.params["oauth_verifier"]

# Get the access token
access_token = consumer.get_access_token(request_token, oauth_verifier)

# Probably save the access token for reuse... This can be done
# with `to_json` and `from_json`.

# Use the token to authenticate an HTTP::Client
client = HTTP::Client.new("api.example.com", tls: true)
access_token.authenticate(client, consumer_key, consumer_secret)

# And do requests as usual
client.get "/some_path"


end
