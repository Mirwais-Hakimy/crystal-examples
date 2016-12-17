# oauth2/client.cr: 1 examples
require "oauth2"

# oauth2/client.cr:12 (001.cr)
require "oauth2"

client_id = "some_client_id"
client_secret = "some_client_secret"
redirect_uri = "http://some.callback"

# Create oauth client, optionally pass custom URIs if needed,
# if the authorize or token URIs are not the standard ones
# (they can also be absolute URLs)
oauth2_client = OAuth2::Client.new("api.example.com", client_id, client_secret,
  redirect_uri: redirect_uri)

# Build an authorize URI
authorize_uri = oauth2_client.get_authorize_uri

# Redirect the user to `authorize_uri`...
#
# ...
#
# When http://some.callback is hit, once the user authorized the access,
# we resume our logic to finally get an access token. The callback URL
# should receive an `authorization_code` parameter that we need to use.
authorization_code = request.params["code"]

# Get the access token
access_token = oauth2_client.get_access_token_using_authorization_code(authorization_code)

# Probably save the access token for reuse... This can be done
# with `to_json` and `from_json`.

# Use the token to authenticate an HTTP::Client
client = HTTP::Client.new("api.example.com", tls: true)
access_token.authenticate(client)

# And do requests as usual
client.get "/some_path"

# If the token expires, we can refresh it
new_access_token = oauth2_client.get_access_token_using_refresh_token(access_token.refresh_token)
