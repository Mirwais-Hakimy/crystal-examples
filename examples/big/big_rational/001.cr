# big/big_rational.cr:8
require "big"

r = BigRational.new(7.to_big_i, 3.to_big_i)
r.to_s # => "7/3"

r = BigRational.new(3, -9)
r.to_s # => "-1/3"
