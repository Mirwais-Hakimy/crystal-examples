# crypto/subtle.cr: 1 examples
require "crypto/subtle"

# crypto/subtle.cr:4 (001.cr)
require "crypto/subtle"

Crypto::Subtle.constant_time_compare("foo", "bar") # => false
Crypto::Subtle.constant_time_compare("foo", "foo") # => true
