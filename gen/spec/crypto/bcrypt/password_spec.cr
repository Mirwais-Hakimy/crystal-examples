require "spec"
require "crypto/bcrypt/password"
it "crypto/bcrypt/password.cr" do
puts # :nocode:

puts "# crypto/bcrypt/password.cr:6 (001.cr)" # :nocode: :example:
# require "crypto/bcrypt/password"

password = Crypto::Bcrypt::Password.create("super secret", cost: 10)
# => $2a$10$rI4xRiuAN2fyiKwynO6PPuorfuoM4L2PVv6hlnVJEmNLjqcibAfHq

( password == "wrong secret" ).should eq( false )
( password == "super secret" ).should eq( true )

puts "# crypto/bcrypt/password.cr:20 (002.cr)" # :nocode: :example:
password = Crypto::Bcrypt::Password.create("super secret", cost: 10)
# => $2a$10$rI4xRiuAN2fyiKwynO6PPuorfuoM4L2PVv6hlnVJEmNLjqcibAfHq

puts "# crypto/bcrypt/password.cr:35 (003.cr)" # :nocode: :example:
password = Crypto::Bcrypt::Password.new("$2a$10$X6rw/jDiLBuzHV./JjBNXe8/Po4wTL0fhdDNdAdjcKN/Fup8tGCya")
( password.version ).to_s.should eq( "2a" )
( password.salt ).to_s.should eq( "X6rw/jDiLBuzHV./JjBNXe" )
( password.digest ).to_s.should eq( "8/Po4wTL0fhdDNdAdjcKN/Fup8tGCya" )

puts "# crypto/bcrypt/password.cr:56 (004.cr)" # :nocode: :example:
password = Crypto::Bcrypt::Password.create("super secret")
( password == "wrong secret" ).should eq( false )
( password == "super secret" ).should eq( true )


end
