# semantic_version.cr:150
require "semantic_version"

prerelease1 = SemanticVersion::Prerelease.new(["rc", 1])
prerelease2 = SemanticVersion::Prerelease.new(["rc", 1, 2])

prerelease1 <=> prerelease2 # => -1
prerelease1 <=> prerelease1 # => 0
prerelease2 <=> prerelease1 # => 1
