require "spec"
require "big"
it "big/big_decimal.cr" do
puts # :nocode:

puts "# big/big_decimal.cr:201 (001.cr)" # :nocode: :example:
# pending by 'file:pendings/big/big_decimal/001.cr' # :pending:
# BigDecimal(1).div(BigDecimal(2))    # => BigDecimal(@value=5, @scale=2)
# BigDecimal(1).div(BigDecimal(3), 5) # => BigDecimal(@value=33333, @scale=5)

puts "# big/big_decimal.cr:511 (002.cr)" # :nocode: :example:
# pending by 'file:pendings/big/big_decimal/002.cr' # :pending:
# require "big"
# 1212341515125412412412421.to_big_d

puts "# big/big_decimal.cr:551 (003.cr)" # :nocode: :example:
# require "big"
1212341515125412412412421.0.to_big_d

puts "# big/big_decimal.cr:575 (004.cr)" # :nocode: :example:
# require "big"
"1212341515125412412412421".to_big_d


end
