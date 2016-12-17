# openssl/ssl/context.cr:71
require "openssl"

context = OpenSSL::SSL::Context::Client.new
context.add_options(OpenSSL::SSL::Options::NO_SSL_V2 | OpenSSL::SSL::Options::NO_SSL_V3)
