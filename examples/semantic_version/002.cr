# semantic_version.cr:64
require "semantic_version"

semver = SemanticVersion.parse("0.27.1")
semver.to_s # => "0.27.1"
