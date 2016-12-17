# openssl/ssl/context.cr:177
require "openssl"

context = OpenSSL::SSL::Context::Client.from_hash({"key" => "private.key", "cert" => "certificate.crt", "ca" => "ca.pem"})
