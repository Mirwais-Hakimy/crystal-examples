# base64.cr: 5 examples
require "base64"

# base64.cr:9 (001.cr)
require "base64"

enc = Base64.encode("Send reinforcements") # => "U2VuZCByZWluZm9yY2VtZW50cw==\n"
plain = Base64.decode_string(enc)          # => "Send reinforcements"

# base64.cr:34 (002.cr)
puts Base64.encode("Now is the time for all good coders\nto learn Crystal")

# base64.cr:58 (003.cr)
Base64.encode("Now is the time for all good coders\nto learn Crystal", STDOUT)

# base64.cr:89 (004.cr)
puts Base64.strict_encode("Now is the time for all good coders\nto learn Crystal")

# base64.cr:115 (005.cr)
Base64.strict_encode("Now is the time for all good coders\nto learn Crystal", STDOUT)
