require "spec"

it "float.cr" do
puts # :nocode:

puts "# float.cr:17 (001.cr)" # :nocode: :example:
1.0     # Float64
1.0_f32 # Float32
1_f32   # Float32

1e10   # Float64
1.5e10 # Float64
1.5e-7 # Float64

+1.3 # Float64
-0.5 # Float64

puts "# float.cr:34 (002.cr)" # :nocode: :example:
1_000_000.111_111 # better than 1000000.111111


end
