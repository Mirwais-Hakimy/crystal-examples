require "spec"
require "digest/*"
it "digest/base.cr" do
puts # :nocode:

puts "# digest/base.cr:14 (001.cr)" # :nocode: :example:
digest = Digest::MD5.digest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
( digest.to_slice.hexstring ).to_s.should eq( "acbd18db4cc2f85cedef654fccc4a4d8" )

puts "# digest/base.cr:30 (002.cr)" # :nocode: :example:
( Digest::MD5.hexdigest("foo") ).to_s.should eq( "acbd18db4cc2f85cedef654fccc4a4d8" )

puts "# digest/base.cr:41 (003.cr)" # :nocode: :example:
Digest::MD5.hexdigest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
# => "acbd18db4cc2f85cedef654fccc4a4d8"

puts "# digest/base.cr:58 (004.cr)" # :nocode: :example:
( Digest::SHA1.base64digest("foo") ).to_s.should eq( "C+7Hteo/D9vJXQ3UfzxbwnXaijM=" )

puts "# digest/base.cr:67 (005.cr)" # :nocode: :example:
Digest::SHA1.base64digest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
# => "C+7Hteo/D9vJXQ3UfzxbwnXaijM="


end
