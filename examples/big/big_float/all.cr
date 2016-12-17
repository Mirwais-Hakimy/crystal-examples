# big/big_float.cr: 2 examples
require "big"

# big/big_float.cr:339 (001.cr)
require "big"
"1234.0".to_big_f

# big/big_float.cr:363 (002.cr)
require "big"
Math.sqrt((1000_000_000_0000.to_big_f*1000_000_000_00000.to_big_f))
