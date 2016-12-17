# big/big_decimal.cr:197
require "big/big_decimal"
BigDecimal(1).div(BigDecimal(2))    # => BigDecimal(@value=5, @scale=2)
BigDecimal(1).div(BigDecimal(3), 5) # => BigDecimal(@value=33333, @scale=5)
