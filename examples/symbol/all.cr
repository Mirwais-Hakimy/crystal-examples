# symbol.cr: 4 examples

# symbol.cr:4 (001.cr)
:hello
:welcome
:"123"
:"symbol with spaces"

# symbol.cr:34 (002.cr)
:crystal.inspect # => ":crystal"

# symbol.cr:50 (003.cr)
:crystal.to_s # => "crystal"

# symbol.cr:59 (004.cr)
Symbol.needs_quotes? "string"      # => false
Symbol.needs_quotes? "long string" # => true
