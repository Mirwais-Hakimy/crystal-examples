# openssl/ssl/context.cr:315
require "openssl"
context.add_options(
  OpenSSL::SSL::Options::ALL |       # various workarounds
  OpenSSL::SSL::Options::NO_SSL_V2 | # disable overly deprecated SSLv2
  OpenSSL::SSL::Options::NO_SSL_V3   # disable deprecated SSLv3
)
