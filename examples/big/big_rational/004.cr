# big/big_rational.cr:200
require "big"
r = BigRational.new(8243243, 562828882)
r.to_s     # => "8243243/562828882"
r.to_s(16) # => "7dc82b/218c1652"
r.to_s(36) # => "4woiz/9b3djm"
