require "spec"
require "http/client"
require "oauth2"
it "oauth2/oauth2.cr" do
puts # :nocode:

puts "# oauth2/oauth2.cr:9 (001.cr)" # :nocode: :example:
# require "http/client"
# require "oauth2"

# Here we use a bearer token, but it could be a mac token. We also set the
# expires in value to 172,800 seconds, or 48 hours
access_token = OAuth2::AccessToken::Bearer.new("some_access_token", 172_800)

# Create an HTTP::Client
client = HTTP::Client.new("api.example.com", tls: true)

# Prepare it for using OAuth2 authentication
access_token.authenticate(client)

# Execute requests as usual: they will be authenticated
client.get("/some_path")


end
