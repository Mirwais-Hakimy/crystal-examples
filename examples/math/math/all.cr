# math/math.cr: 3 examples
require "math/math"

# math/math.cr:70 (001.cr)
Math.lgamma(2.96)

# math/math.cr:74 (002.cr)
Math.log(Math.gamma(2.96).abs)

# math/math.cr:215 (003.cr)
Math.pw2ceil(33) # => 64
