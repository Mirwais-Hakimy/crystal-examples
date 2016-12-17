# random/secure.cr: 1 examples
require "random/secure"

# random/secure.cr:9 (001.cr)
Random::Secure.rand(6)            # => 4
[1, 5, 6].shuffle(Random::Secure) # => [6, 1, 5]
