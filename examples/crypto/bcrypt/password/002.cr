# crypto/bcrypt/password.cr:20
require "crypto/bcrypt/password"
password = Crypto::Bcrypt::Password.create("super secret", cost: 10)
# => $2a$10$rI4xRiuAN2fyiKwynO6PPuorfuoM4L2PVv6hlnVJEmNLjqcibAfHq
