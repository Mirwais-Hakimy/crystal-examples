# openssl/ssl/context.cr:152
require "openssl"
context = OpenSSL::SSL::Context::Server.new
context.add_options(OpenSSL::SSL::Options::NO_SSL_V2 | OpenSSL::SSL::Options::NO_SSL_V3)
