# openssl/x509/name.cr:63
require "openssl"
name = OpenSSL::X509::Name.parse("CN=Nobody/DC=example")
name.to_a # => [{"CN", "Nobody"}, {"DC", "example"}]
