require "spec"

it "random.cr" do
puts # :nocode:

puts "# random.cr:6 (001.cr)" # :nocode: :example:
( Random.rand ).try(&.to_f).to_s.should eq( "0.167595" )
( Random.rand(5) ).should eq( 2 )

puts "# random.cr:13 (002.cr)" # :nocode: :example:
r = Random.new
( r.rand ).try(&.to_f).to_s.should eq( "0.0372991" )
( r.next_bool ).should eq( true )
( r.next_int ).should eq( 2223112 )

puts "# random.cr:22 (003.cr)" # :nocode: :example:
( rand ).try(&.to_f).to_s.should eq( "0.293829" )
( rand(10) ).should eq( 8 )

puts "# random.cr:73 (004.cr)" # :nocode: :example:
( Random.new.next_bool ).should eq( true )

puts "# random.cr:93 (005.cr)" # :nocode: :example:
r = Random.new
( r.rand ).try(&.to_f).to_s.should eq( "0.167595" )
( r.rand ).try(&.to_f).to_s.should eq( "0.0372991" )

puts "# random.cr:107 (006.cr)" # :nocode: :example:
( Random.new.rand(10) ).should eq( 5 )
( Random.new.rand(5000) ).should eq( 2243 )

puts "# random.cr:248 (007.cr)" # :nocode: :example:
( Random.new.rand(3.5) ).try(&.to_f).to_s.should eq( "2.88938" )
( Random.new.rand(10.725) ).try(&.to_f).to_s.should eq( "7.70147" )

puts "# random.cr:264 (008.cr)" # :nocode: :example:
( Random.new.rand(10..20) ).should eq( 14 )
( Random.new.rand(Int64::MIN..Int64::MAX) ).should eq( -5297435808626736140 )

puts "# random.cr:274 (009.cr)" # :nocode: :example:
( Random.new.rand(6.2..21.768) ).try(&.to_f).to_s.should eq( "15.2989" )

puts "# random.cr:294 (010.cr)" # :nocode: :example:
( slice = Bytes.new(4) ).should eq( [0, 0, 0, 0] )
Random.new.random_bytes(slice)
( slice ).should eq( [217, 118, 38, 196] )

puts "# random.cr:316 (011.cr)" # :nocode: :example:
( Random.new.random_bytes ).should eq( [145, 255, 191, 133, 132, 139, 53, 136, 93, 238, 2, 37, 138, 244, 3, 216] )
( Random.new.random_bytes(4) ).should eq( [217, 118, 38, 196] )

puts "# random.cr:329 (012.cr)" # :nocode: :example:
( Random::Secure.base64(4) ).to_s.should eq( "fK1eYg==" )

puts "# random.cr:343 (013.cr)" # :nocode: :example:
( Random::Secure.urlsafe_base64 ).to_s.should eq( "MAD2bw8QaBdvITCveBNCrw" )
( Random::Secure.urlsafe_base64(8, padding: true) ).to_s.should eq( "vvP1kcs841I=" )
( Random::Secure.urlsafe_base64(16, padding: true) ).to_s.should eq( "og2aJrELDZWSdJfVGkxNKw==" )

puts "# random.cr:360 (014.cr)" # :nocode: :example:
( Random::Secure.hex ).to_s.should eq( "05f100a1123f6bdbb427698ab664ff5f" )
( Random::Secure.hex(1) ).to_s.should eq( "1a" )


end
