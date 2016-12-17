# colorize.cr: 12 examples
require "colorize"

# colorize.cr:7 (001.cr)
require "colorize"

"foo".colorize(:green)
100.colorize(:red)
[1, 2, 3].colorize(:blue)

# colorize.cr:16 (002.cr)
"foo".colorize.fore(:green)
"foo".colorize.green

# colorize.cr:22 (003.cr)
"foo".colorize.back(:green)
"foo".colorize.on(:green)
"foo".colorize.on_green

# colorize.cr:29 (004.cr)
"foo".colorize(Colorize::ColorRGB.new(0, 255, 255)) # => "foo" in aqua

# colorize.cr:34 (005.cr)
"foo".colorize(Colorize::Color256.new(208)) # => "foo" in orange

# colorize.cr:39 (006.cr)
"foo".colorize.mode(:underline)
"foo".colorize.underline

# colorize.cr:46 (007.cr)
"foo".colorize.fore(:yellow).back(:blue).mode(:underline)

# colorize.cr:52 (008.cr)
"foo".colorize(:red).toggle(false)              # => "foo" without color
"foo".colorize(:red).toggle(false).toggle(true) # => "foo" in red

# colorize.cr:59 (009.cr)
"foo".colorize(some_bool ? :green : :default)

# colorize.cr:64 (010.cr)
:default
:black
:red
:green
:yellow
:blue
:magenta
:cyan
:light_gray
:dark_gray
:light_red
:light_green
:light_yellow
:light_blue
:light_magenta
:light_cyan
:white

# colorize.cr:85 (011.cr)
# pending by 'file:pendings/colorize/008.cr'
# :bold
# :bright
# :dim
# :underline
# :blink
# :reverse
# :hidden

# colorize.cr:100 (012.cr)
Colorize.enabled = true
"hello".colorize.red.to_s # => "\e[31mhello\e[0m"

Colorize.enabled = false
"hello".colorize.red.to_s # => "hello"
