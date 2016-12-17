# crypto/bcrypt/password.cr:56
require "crypto/bcrypt/password"
password = Crypto::Bcrypt::Password.create("super secret")
password == "wrong secret" # => false
password == "super secret" # => true
