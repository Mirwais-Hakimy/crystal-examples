# openssl/ssl/context.cr:334
require "openssl"
context.remove_options(OpenSSL::SSL::Options::NO_SSL_V3)
