# openssl/x509/name.cr:49
require "openssl"
name = OpenSSL::X509::Name.new
name.add_entry "CN", "Nobody"
name.add_entry "DC", "example"
