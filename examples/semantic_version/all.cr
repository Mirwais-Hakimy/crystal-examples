# semantic_version.cr: 6 examples
require "semantic_version"

# semantic_version.cr:24 (001.cr)
require "semantic_version"

semver = SemanticVersion.parse("2.61.4")
semver # => #<SemanticVersion:0x55b3667c9e70 @major=2, @minor=61, @patch=4, ... >

# semantic_version.cr:64 (002.cr)
require "semantic_version"

semver = SemanticVersion.parse("0.27.1")
semver.to_s # => "0.27.1"

# semantic_version.cr:83 (003.cr)
require "semantic_version"

semver1 = SemanticVersion.new(1, 0, 0)
semver2 = SemanticVersion.new(2, 0, 0)

semver1 <=> semver2 # => -1
semver2 <=> semver2 # => 0
semver2 <=> semver1 # => 1

# semantic_version.cr:111 (004.cr)
require "semantic_version"

prerelease = SemanticVersion::Prerelease.parse("rc.1.3")
prerelease # => SemanticVersion::Prerelease(@identifiers=["rc", 1, 3])

# semantic_version.cr:138 (005.cr)
require "semantic_version"

semver = SemanticVersion.parse("0.27.1-rc.1")
semver.prerelease.to_s # => "rc.1"

# semantic_version.cr:150 (006.cr)
require "semantic_version"

prerelease1 = SemanticVersion::Prerelease.new(["rc", 1])
prerelease2 = SemanticVersion::Prerelease.new(["rc", 1, 2])

prerelease1 <=> prerelease2 # => -1
prerelease1 <=> prerelease1 # => 0
prerelease2 <=> prerelease1 # => 1
