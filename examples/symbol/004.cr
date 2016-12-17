# symbol.cr:59
Symbol.needs_quotes? "string"      # => false
Symbol.needs_quotes? "long string" # => true
