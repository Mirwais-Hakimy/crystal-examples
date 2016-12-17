# openssl/x509/name.cr:10
require "openssl"

OpenSSL::X509::Name.parse("CN=nobody/DC=example")
