# colorize.cr:100
require "colorize"
Colorize.enabled = true
"hello".colorize.red.to_s # => "\e[31mhello\e[0m"

Colorize.enabled = false
"hello".colorize.red.to_s # => "hello"
