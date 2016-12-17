# semantic_version.cr:83
require "semantic_version"

semver1 = SemanticVersion.new(1, 0, 0)
semver2 = SemanticVersion.new(2, 0, 0)

semver1 <=> semver2 # => -1
semver2 <=> semver2 # => 0
semver2 <=> semver1 # => 1
