# semantic_version.cr:24
require "semantic_version"

semver = SemanticVersion.parse("2.61.4")
semver # => #<SemanticVersion:0x55b3667c9e70 @major=2, @minor=61, @patch=4, ... >
