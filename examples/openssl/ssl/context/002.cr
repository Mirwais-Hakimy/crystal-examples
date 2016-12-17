# openssl/ssl/context.cr:99
require "openssl"

context = OpenSSL::SSL::Context::Client.from_hash({"key" => "private.key", "cert" => "certificate.crt", "ca" => "ca.pem"})
