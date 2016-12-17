# slice.cr:364
slice = UInt8.slice(97, 62, 63, 8, 255)
slice.hexstring # => "613e3f08ff"
