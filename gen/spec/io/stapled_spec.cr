require "spec"
require "io/stapled"
it "io/stapled.cr" do
puts # :nocode:

puts "# io/stapled.cr:5 (001.cr)" # :nocode: :example:
io = IO::Stapled.new(*IO.pipe)
io.puts "linus"
( io.gets ).to_s.should eq( "linus" )


end
