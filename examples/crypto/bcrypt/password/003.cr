# crypto/bcrypt/password.cr:35
require "crypto/bcrypt/password"
password = Crypto::Bcrypt::Password.new("$2a$10$X6rw/jDiLBuzHV./JjBNXe8/Po4wTL0fhdDNdAdjcKN/Fup8tGCya")
password.version # => "2a"
password.salt    # => "X6rw/jDiLBuzHV./JjBNXe"
password.digest  # => "8/Po4wTL0fhdDNdAdjcKN/Fup8tGCya"
