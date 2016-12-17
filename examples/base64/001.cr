# base64.cr:9
require "base64"

enc = Base64.encode("Send reinforcements") # => "U2VuZCByZWluZm9yY2VtZW50cw==\n"
plain = Base64.decode_string(enc)          # => "Send reinforcements"
