# big/big_int.cr:372
require "big"
BigInt.new("123456789101101987654321").to_s(8)  # => "32111154373025463465765261"
BigInt.new("123456789101101987654321").to_s(16) # => "1a249b1f61599cd7eab1"
BigInt.new("123456789101101987654321").to_s(36) # => "k3qmt029k48nmpd"
