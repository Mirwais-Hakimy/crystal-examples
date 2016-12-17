# crypto/bcrypt/password.cr: 4 examples
require "crypto/bcrypt/password"

# crypto/bcrypt/password.cr:6 (001.cr)
require "crypto/bcrypt/password"

password = Crypto::Bcrypt::Password.create("super secret", cost: 10)
# => $2a$10$rI4xRiuAN2fyiKwynO6PPuorfuoM4L2PVv6hlnVJEmNLjqcibAfHq

password == "wrong secret" # => false
password == "super secret" # => true

# crypto/bcrypt/password.cr:20 (002.cr)
password = Crypto::Bcrypt::Password.create("super secret", cost: 10)
# => $2a$10$rI4xRiuAN2fyiKwynO6PPuorfuoM4L2PVv6hlnVJEmNLjqcibAfHq

# crypto/bcrypt/password.cr:35 (003.cr)
password = Crypto::Bcrypt::Password.new("$2a$10$X6rw/jDiLBuzHV./JjBNXe8/Po4wTL0fhdDNdAdjcKN/Fup8tGCya")
password.version # => "2a"
password.salt    # => "X6rw/jDiLBuzHV./JjBNXe"
password.digest  # => "8/Po4wTL0fhdDNdAdjcKN/Fup8tGCya"

# crypto/bcrypt/password.cr:56 (004.cr)
password = Crypto::Bcrypt::Password.create("super secret")
password == "wrong secret" # => false
password == "super secret" # => true
