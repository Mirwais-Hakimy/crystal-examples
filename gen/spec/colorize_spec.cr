require "spec"
require "colorize"
it "colorize.cr" do
puts # :nocode:

puts "# colorize.cr:7 (001.cr)" # :nocode: :example:
# require "colorize"

"foo".colorize(:green)
100.colorize(:red)
[1, 2, 3].colorize(:blue)

puts "# colorize.cr:16 (002.cr)" # :nocode: :example:
"foo".colorize.fore(:green)
"foo".colorize.green

puts "# colorize.cr:22 (003.cr)" # :nocode: :example:
"foo".colorize.back(:green)
"foo".colorize.on(:green)
"foo".colorize.on_green

puts "# colorize.cr:29 (004.cr)" # :nocode: :example:
( "foo".colorize(Colorize::ColorRGB.new(0, 255, 255)) ).should eq( "foo" in aqua )

puts "# colorize.cr:34 (005.cr)" # :nocode: :example:
( "foo".colorize(Colorize::Color256.new(208)) ).should eq( "foo" in orange )

puts "# colorize.cr:39 (006.cr)" # :nocode: :example:
"foo".colorize.mode(:underline)
"foo".colorize.underline

puts "# colorize.cr:46 (007.cr)" # :nocode: :example:
"foo".colorize.fore(:yellow).back(:blue).mode(:underline)

puts "# colorize.cr:52 (008.cr)" # :nocode: :example:
( "foo".colorize(:red).toggle(false) ).should eq( "foo" without color )
( "foo".colorize(:red).toggle(false).toggle(true) ).should eq( "foo" in red )

puts "# colorize.cr:59 (009.cr)" # :nocode: :example:
"foo".colorize(some_bool ? :green : :default)

puts "# colorize.cr:64 (010.cr)" # :nocode: :example:
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

puts "# colorize.cr:85 (011.cr)" # :nocode: :example:
# pending by 'file:pendings/colorize/008.cr' # :pending:
# :bold
# :bright
# :dim
# :underline
# :blink
# :reverse
# :hidden

puts "# colorize.cr:100 (012.cr)" # :nocode: :example:
Colorize.enabled = true
( "hello".colorize.red.to_s ).to_s.should eq( "\e[31mhello\e[0m" )

Colorize.enabled = false
( "hello".colorize.red.to_s ).to_s.should eq( "hello" )


end
