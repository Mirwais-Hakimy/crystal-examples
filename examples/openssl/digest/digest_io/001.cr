# openssl/digest/digest_io.cr:8
require "openssl"

underlying_io = IO::Memory.new("foo")
io = OpenSSL::DigestIO.new(underlying_io, "SHA256")
buffer = Bytes.new(256)
io.read(buffer)
io.digest.hexstring # => "2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae"
