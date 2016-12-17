# crypto/subtle.cr:4
require "crypto/subtle"

Crypto::Subtle.constant_time_compare("foo", "bar") # => false
Crypto::Subtle.constant_time_compare("foo", "foo") # => true
