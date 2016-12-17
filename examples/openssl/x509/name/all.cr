# openssl/x509/name.cr: 3 examples
require "openssl"

# openssl/x509/name.cr:10 (001.cr)
require "openssl"

OpenSSL::X509::Name.parse("CN=nobody/DC=example")

# openssl/x509/name.cr:49 (002.cr)
name = OpenSSL::X509::Name.new
name.add_entry "CN", "Nobody"
name.add_entry "DC", "example"

# openssl/x509/name.cr:63 (003.cr)
name = OpenSSL::X509::Name.parse("CN=Nobody/DC=example")
name.to_a # => [{"CN", "Nobody"}, {"DC", "example"}]
