# kernel.cr:349
sprintf "%d %04x", 123, 123             # => "123 007b"
sprintf "%08b '%4s'", 123, 123          # => "01111011 ' 123'"
sprintf "%+g:% g:%-g", 1.23, 1.23, 1.23 # => "+1.23: 1.23:1.23"
