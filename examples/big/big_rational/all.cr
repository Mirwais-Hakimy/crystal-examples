# big/big_rational.cr: 7 examples
require "big"

# big/big_rational.cr:8 (001.cr)
require "big"

r = BigRational.new(7.to_big_i, 3.to_big_i)
r.to_s # => "7/3"

r = BigRational.new(3, -9)
r.to_s # => "-1/3"

# big/big_rational.cr:132 (002.cr)
BigRational.new(2, 3) >> 2 # => 1/6

# big/big_rational.cr:141 (003.cr)
BigRational.new(2, 3) << 2 # => 8/3

# big/big_rational.cr:200 (004.cr)
r = BigRational.new(8243243, 562828882)
r.to_s     # => "8243243/562828882"
r.to_s(16) # => "7dc82b/218c1652"
r.to_s(36) # => "4woiz/9b3djm"

# big/big_rational.cr:249 (005.cr)
require "big"
123.to_big_r

# big/big_rational.cr:282 (006.cr)
require "big"
123.0.to_big_r

# big/big_rational.cr:297 (007.cr)
require "big"
Math.sqrt((1000_000_000_0000.to_big_r*1000_000_000_00000.to_big_r))
