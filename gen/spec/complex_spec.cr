require "spec"
require "complex"
it "complex.cr" do
puts # :nocode:

puts "# complex.cr:6 (001.cr)" # :nocode: :example:
# require "complex"

( Complex.new(1, 0) ).to_s.should eq( "1.0 + 0.0i" )
( Complex.new(5, -12) ).to_s.should eq( "5.0 - 12.0i" )

( 1.to_c ).to_s.should eq( "1.0 + 0.0i" )
( 1.i ).to_s.should eq( "0.0 + 1.0i" )

puts "# complex.cr:86 (002.cr)" # :nocode: :example:
( Complex.new(42, 2).to_s ).to_s.should eq( "42.0 + 2.0i" )

puts "# complex.cr:98 (003.cr)" # :nocode: :example:
( Complex.new(42, 2).inspect ).to_s.should eq( "(42.0 + 2.0i)" )

puts "# complex.cr:110 (004.cr)" # :nocode: :example:
( Complex.new(42, 2).abs ).try(&.to_f).to_s.should eq( "42.04759208325728" )
( Complex.new(-42, 2).abs ).try(&.to_f).to_s.should eq( "42.04759208325728" )

puts "# complex.cr:120 (005.cr)" # :nocode: :example:
( Complex.new(42, 2).abs2 ).should eq( 1768 )

puts "# complex.cr:138 (006.cr)" # :nocode: :example:
( Complex.new(42, 2).polar ).should eq( {42.047592083257278, 0.047583103276983396} )

puts "# complex.cr:147 (007.cr)" # :nocode: :example:
( Complex.new(42, 2).conj ).to_s.should eq( "42.0 - 2.0i" )
( Complex.new(42, -2).conj ).to_s.should eq( "42.0 + 2.0i" )

puts "# complex.cr:183 (008.cr)" # :nocode: :example:
( Complex.new(4, 2).exp ).to_s.should eq( "-22.720847417619233 + 49.645957334580565i" )


end
