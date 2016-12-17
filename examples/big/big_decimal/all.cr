# big/big_decimal.cr: 4 examples
require "big"

# big/big_decimal.cr:201 (001.cr)
# pending by 'file:pendings/big/big_decimal/001.cr'
# BigDecimal(1).div(BigDecimal(2))    # => BigDecimal(@value=5, @scale=2)
# BigDecimal(1).div(BigDecimal(3), 5) # => BigDecimal(@value=33333, @scale=5)

# big/big_decimal.cr:511 (002.cr)
# pending by 'file:pendings/big/big_decimal/002.cr'
# require "big"
# 1212341515125412412412421.to_big_d

# big/big_decimal.cr:551 (003.cr)
require "big"
1212341515125412412412421.0.to_big_d

# big/big_decimal.cr:575 (004.cr)
require "big"
"1212341515125412412412421".to_big_d
