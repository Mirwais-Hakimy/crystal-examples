# random/secure.cr:9
require "random/secure"
Random::Secure.rand(6)            # => 4
[1, 5, 6].shuffle(Random::Secure) # => [6, 1, 5]
