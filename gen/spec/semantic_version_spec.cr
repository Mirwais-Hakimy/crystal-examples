require "spec"
require "semantic_version"
it "semantic_version.cr" do
puts # :nocode:

puts "# semantic_version.cr:24 (001.cr)" # :nocode: :example:
# require "semantic_version"

semver = SemanticVersion.parse("2.61.4")
( semver ).class.to_s.should eq( "SemanticVersion" )

puts "# semantic_version.cr:64 (002.cr)" # :nocode: :example:
# require "semantic_version"

semver = SemanticVersion.parse("0.27.1")
( semver.to_s ).to_s.should eq( "0.27.1" )

puts "# semantic_version.cr:83 (003.cr)" # :nocode: :example:
# require "semantic_version"

semver1 = SemanticVersion.new(1, 0, 0)
semver2 = SemanticVersion.new(2, 0, 0)

( semver1 <=> semver2 ).should eq( -1 )
( semver2 <=> semver2 ).should eq( 0 )
( semver2 <=> semver1 ).should eq( 1 )

puts "# semantic_version.cr:111 (004.cr)" # :nocode: :example:
# require "semantic_version"

prerelease = SemanticVersion::Prerelease.parse("rc.1.3")
( prerelease ).should eq( SemanticVersion::Prerelease(@identifiers=["rc", 1, 3]) )

puts "# semantic_version.cr:138 (005.cr)" # :nocode: :example:
# require "semantic_version"

semver = SemanticVersion.parse("0.27.1-rc.1")
( semver.prerelease.to_s ).to_s.should eq( "rc.1" )

puts "# semantic_version.cr:150 (006.cr)" # :nocode: :example:
# require "semantic_version"

prerelease1 = SemanticVersion::Prerelease.new(["rc", 1])
prerelease2 = SemanticVersion::Prerelease.new(["rc", 1, 2])

( prerelease1 <=> prerelease2 ).should eq( -1 )
( prerelease1 <=> prerelease1 ).should eq( 0 )
( prerelease2 <=> prerelease1 ).should eq( 1 )


end
