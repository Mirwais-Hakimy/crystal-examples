# openssl/ssl/context.cr: 7 examples
require "openssl"

# openssl/ssl/context.cr:71 (001.cr)
require "openssl"

context = OpenSSL::SSL::Context::Client.new
context.add_options(OpenSSL::SSL::Options::NO_SSL_V2 | OpenSSL::SSL::Options::NO_SSL_V3)

# openssl/ssl/context.cr:99 (002.cr)
require "openssl"

context = OpenSSL::SSL::Context::Client.from_hash({"key" => "private.key", "cert" => "certificate.crt", "ca" => "ca.pem"})

# openssl/ssl/context.cr:152 (003.cr)
context = OpenSSL::SSL::Context::Server.new
context.add_options(OpenSSL::SSL::Options::NO_SSL_V2 | OpenSSL::SSL::Options::NO_SSL_V3)

# openssl/ssl/context.cr:177 (004.cr)
require "openssl"

context = OpenSSL::SSL::Context::Client.from_hash({"key" => "private.key", "cert" => "certificate.crt", "ca" => "ca.pem"})

# openssl/ssl/context.cr:315 (005.cr)
context.add_options(
  OpenSSL::SSL::Options::ALL |       # various workarounds
  OpenSSL::SSL::Options::NO_SSL_V2 | # disable overly deprecated SSLv2
  OpenSSL::SSL::Options::NO_SSL_V3   # disable deprecated SSLv3
)

# openssl/ssl/context.cr:334 (006.cr)
context.remove_options(OpenSSL::SSL::Options::NO_SSL_V3)

# openssl/ssl/context.cr:365 (007.cr)
# pending by 'file:pendings/openssl/ssl/context/005.cr'
# context.alpn_protocol = "h2"
