# slice.cr:396
slice = UInt8.slice(97, 62, 63, 8, 255)
slice.hexdump # => "00000000  61 3e 3f 08 ff                                    a>?.."
